---
title: Css总结
date: 2023-11-21 14:41:09
tags:
 - CSS
categories:
 - CSS
summary: CSS语法总结
---
# CSS语法总结

## CSS优先级

`继承<通配符选择器<标签选择器<类选择器<id选择器<行内样式<!important`

## 设置全局背景的方法
```scss
@mixin fullcolor {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}
.container{
    @include fullcolor;
    background:red;
}
```
## 全局清除样式

```css
      *{
            margin: 0;
            padding: 0;
        }

        html,
        body {
            width: 100%;
            min-width: 1000px;
            height: 100%;
            min-height: 400px;
            overflow: hidden; 
            overflow-y:auto;overflow-x:auto;
            // auto为自动拉伸
        }
```
## 标签居中`margin:0 auto;`

- 居中相对于的是父级元素，需要<font color=red>设置宽度</font > 
- 若采用该样式的元素未设置`width`大小将没有用处

## css原生选择器
### 后代选择器

```css
div p{
    margin:0 auto;
    text-decoration:none;
}
```

### 子代选择器

- 使用==标签==选择子代

```css
<div style="margin:0 auto;height: 500px">
    <p><a href="#">?fas</a></p>
</div>
```

```css
div p > a {
            color: red;
        }
```

- 使用标签的==id==选择子代
```css
 #div1 p > a,span {
          color: red;
      }
```

## 伪类:用做背景颜色的设置等等

```css
.a::after{
    content:"";
    position:absolute;
    top:0;
    left:0;
    z-index:-1;
}
```

## 背景图片样式设置
### 背景平铺 `background-repeat:no-repeat`

```css
 #div1 {
            color: red;
            background-image: url("1.jpg");
            background-repeat: no-repeat;
            width:30000px;
            height: 1440px;
            ackground-positio:center center
        }
```

### 背景图片显示位置`background-positio:center center`

```css
 #div1 {
            color: red;
            background-image: url("1.jpg");
            background-repeat: no-repeat;
            width:30000px;
            height: 1440px;
```

## 元素显示模式:block,inline-block,inline
| 属性                    | 效果               |
| ----------------------- | ------------------ |
| `display:block`         | 转化为块级元素     |
| `display：inline-block` | 转化为行内块级元素 |
| `display：inline`       | 转化为行内元素     |
### inline:无法设置宽度和高度,只能自适应子元素大小,
修改高度通过`line-height`

给元素设置行高不会被执行自动忽略，实际所占大小依照元素内容大小
```css
 #div1 {
            width: 100px;//被忽略
            height: 100px;
            background-color: red;  
        }
```

- 代表标签：`a,p,h,span,label`

- 代表标签 `inline、textarea、input、select、reset`
## 标签嵌套 

- [ ] `p`标签不能嵌套其他标签
- [ ] `a标签可以嵌套出了自己（a）以外的其他标签`

## SS继承性

- [ ] `a`标签不会继承父级元素的颜色属性
- [ ] `h`标签不会继承父级元素字体大小属性 `font-size`


## 两种盒子模型

```css
div {
            width: 100px;
            height: 100px;
            background-color: #00b7ee;
            margin: 0 auto;
            border:1px solid #000;
            padding:10px 10px 10px 10px;
            box-sizing:border-box; //这里不同
    /*

}
```

`box-sizing` 是一个 CSS 属性，用于设置元素的盒模型大小计算方式。它有两个取值：`content-box` 和 `border-box`,前者为标准盒子模型,后者为怪异盒子模型,

### 标准盒子模型:(少用,为了保持元素和外边框的边距少用这个)

 `content-box` 是默认值，它表示元素的宽度和高度只包括内容区域（content），不包括边框（border）和内边距（padding）。也就是说，当你设置一个元素的宽度为 100px 时，它的内容区域宽度就是 100px，而整个元素的宽度则是内容宽度加上边框和内边距的宽度。这意味着，如果你设置了边框或内边距，就会导致元素的实际宽度比你设置的宽度更宽。

### 怪异模型
`border-box` 表示元素的宽度和高度包括内容区域、边框和内边距，也就是说，当你设置一个元素的宽度为 100px 时，它的实际宽度就是 100px，包括了内容宽度、边框和内边距的宽度。这样设置可以让开发者更方便地控制元素的尺寸，避免因为边框和内边距的加入而导致元素的尺寸不准确。

总的来说，`box-sizing` 的作用是控制元素的盒模型大小计算方式，从而更方便地控制元素的尺寸。

当你需要设置边框和内边距时，使用 `border-box` 可以更好地控制元素的实际尺寸，避免出现意外的布局问题.



## 修改`inline`行内标签元素垂直位置

```css
//只能通过修改属性line-height来实现，margin-top and bottom 都是无效的，padding也是无效的
```
## [flex 布局](https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_flexible_box_layout/Basic_concepts_of_flexbox#flex_元素属性：flex-grow)
###  主轴方向 `flex-wrap:row nowrap`
   这是`display:flex`初始样子,主轴为水平,不换行;如果子元素宽高过长溢出就会溢出,**会压缩子元素的宽度和高度**
###  flex子元素水平拉伸属性: `flex-basis`  
   
   写在flex布局的下的**子元素**,以下选择的属性,
  
   /* 指定<'width'> */
   - flex-basis: auto;根据子元素自动扩展
   - flex-basis: 10em;
   - flex-basis: 3px;
   - flex-basis: auto;根据子元素自动扩展
  
   /* 固有的尺寸关键词 */
   - flex-basis: fill;
   - flex-basis: max-content;
   - flex-basis: min-content;
   - flex-basis: fit-content;
   - /* 在 flex item 内容上的自动尺寸 */
   - flex-basis: content;
  
   /* 全局数值 */
   - flex-basis: inherit; 继承最近父元素的 flex-basis 值
   - flex-basis: initial;
     
     表示将 flex-basis 值重置为其初始值，即自动计算伸缩项的大小。通常情况下，这个值等价于 flex-basis: auto;

   - flex-basis: unset;

   - flex-basis: unset;
  
     默认情况下，它等价于 flex-basis: auto;，但是在使用 flex 缩写属性时，它可能会等价于 flex-basis: 0
###  flex子元素伸展属性`flex-grow`:基于`flex-basis`
   flex-grow 若被赋值为一个**正整数**，flex 元素会以 flex-basis 为基础，沿主轴方向增长尺寸。这会使该元素延展，并占据此方向轴上的可用空间（available space）。如果有其他元素也被允许延展，那么他们会各自占据可用空间的一部分。

如果我们给上例中的**所有元素设定 flex-grow 值为 1**，容器中的可用空间会被这些元素**平分**。它们会延展以填满容器主轴方向上的空间。

### flex子元素压缩属性:`flex-shrink`
flex-grow属性是处理 flex 元素在主轴上增加空间的问题，相反flex-shrink属性是处理 flex 元素收缩的问题。如果我们的容器中没有足够排列 flex 元素的空间，那么可以把 flex 元素**flex-shrink属性设置为正整数来缩小它所占空间**到flex-basis以下。与flex-grow属性一样，可以赋予不同的值来控制 flex 元素收缩的程度 —— 给flex-shrink属性赋予更大的数值可以比赋予小数值的同级元素收缩程度更大。


负值是不被允许的
```css
flex-shrink: 2;
flex-shrink: 0.6;

/* Global values */
flex-shrink: inherit;
flex-shrink: initial;
flex-shrink: unset;
```

### flex属性简写
Flex 简写形式允许你把三个数值按这个顺序书写 — flex-grow，flex-shrink，flex-basis:
`flex:1 0 auto`

### flex对齐属性
控制对齐的属性本指南中的属性如下。

justify-content - 控制主轴（横轴）上所有 flex 布局下的元素的对齐。

align-items - 控制交叉轴（纵轴）上所有 flex 布局下的元素对齐。

align-self - 控制交叉轴（纵轴）上的单个 flex 布局下的元素对齐。 //align-self:stretch  /* 该项在交叉轴上拉伸以填充可用空间 */

align-content - 控制“多条主轴”的 flex 布局下的元素在交叉轴的对齐。

### fixed定位,absolute定位

这些定位作用于flex布局下的任意元素会影响到整体的flex布局方式,调整相对位置用position:relative,或者用margin去调整

## 文本排列方式
这些 CSS 属性都涉及文本方向和排列方式。

- `horizontal-tb` 是 CSS 中默认的文本排列方式，即从左到右、从上到下，也就是水平方向从左到右，垂直方向从上到下排列。这是大多数语言的书写方式，如英语、中文等。

- `vertical-rl` 表示文本的排列方向是从上到下，从右到左。这种排列方式常用于一些从右到左书写的语言，如阿拉伯语等。

- `vertical-lr` 表示文本的排列方向是从上到下，从左到右。这种排列方式同样适用于一些从右到左书写的语言，如波斯语等。

- `sideways-rl` 表示文本的排列方式是从上到下，从右到左，但是排列方式是横向的，即文字是横向书写的。这种排列方式常常用于一些特殊排版需求，如横向排列的表格标题等。

- `sideways-lr` 表示文本的排列方式是从上到下，从左到右，但是排列方式是横向的，即文字是横向书写的。这种排列方式同样适用于一些特殊排版需求，如横向排列的表格标题等。

    ```css
    .box {
        display: flex;
        writing-mode: horizontal-tb;
    }
    ```
    