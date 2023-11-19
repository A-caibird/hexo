---
title: vue 函数获取原生 dom
date: 2023-11-19 20:34:50
tags:
  - vue
categories:
 - vue
summary: vue 事件处理函数获取原生 dom
---
```typescript
<script setup lang="ts">

function handleChange(event:any) {
  // `event` 隐式地标注为 `any` 类型
  console.log(event.target.value)
}
</script>

<template>
  <input type="text" @change="handleChange" />
</template>
```

