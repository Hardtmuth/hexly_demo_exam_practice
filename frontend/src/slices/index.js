import { configureStore } from '@reduxjs/toolkit'
import goodsSlice from './goodsSlice.js'

export default configureStore({
  reducer: {
    goods: goodsSlice,
  },
})