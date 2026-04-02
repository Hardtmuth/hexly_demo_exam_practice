import { createSlice, createEntityAdapter, createAsyncThunk } from '@reduxjs/toolkit'
import axios from 'axios'
import routes from '../routes.js'

export const fetchGoods = createAsyncThunk(
  'goods/fetchGoods',
  async () => {
    // const token = JSON.parse(localStorage.getItem('userId')).token
    //if (!token) {
    //  throw new Error('Токен не найден')
    //}
    const response = await axios.get(routes.goodsPath())
    console.log(response)
    return response.data
  },
)

const goodsAdapter = createEntityAdapter()

const initialState = goodsAdapter.getInitialState({
  status: 'idle', // idle | loading | succeeded | failed
  error: null,
})

const goodsSlice = createSlice({
  name: 'goods',
  initialState,
  /* reducers: {
    addM: goodsAdapter.addOne,
  }, */
  extraReducers: (builder) => {
    builder
      .addCase(fetchGoods.pending, (state) => {
        state.status = 'loading'
      })
      .addCase(fetchGoods.fulfilled, (state, action) => {
        goodsAdapter.setAll(state, action.payload)
        state.status = 'succeeded'
        state.error = null
      })
      .addCase(fetchGoods.rejected, (state, action) => {
        state.status = 'failed'
        state.error = action.error.message || 'Unknown error'
      })
  },
})

// export const { addM } = messagesSlice.actions
export const goodsSelectors = goodsAdapter.getSelectors(state => state.goods)
export default goodsSlice.reducer