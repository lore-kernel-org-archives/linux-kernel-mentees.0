Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A43C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 10:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 607DA81414;
	Mon, 31 Jul 2023 10:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 607DA81414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNDfTmuLHFID; Mon, 31 Jul 2023 10:24:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3B2D4813EA;
	Mon, 31 Jul 2023 10:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B2D4813EA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07F1AC0072;
	Mon, 31 Jul 2023 10:24:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81C6BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 10:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5483A60AC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 10:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5483A60AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 122I1ZiI4TPq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 10:24:19 +0000 (UTC)
X-Greylist: delayed 927 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 10:24:19 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A91760A7D
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A91760A7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 10:24:18 +0000 (UTC)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RDv4t6tCFz6J6WY;
 Mon, 31 Jul 2023 18:05:34 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 11:08:47 +0100
Date: Mon, 31 Jul 2023 11:08:46 +0100
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: [PATCH] iio: accel: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <20230731110846.00004176@Huawei.com>
In-Reply-To: <20230731014406.22810-1-rauji.raut@gmail.com>
References: <20230731014406.22810-1-rauji.raut@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, cosmin.tanislav@analog.com,
 linux-iio@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 jic23@kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Jonathan Cameron via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 30 Jul 2023 18:44:06 -0700
Atul Raut <rauji.raut@gmail.com> wrote:

Patch title should mention the device

iio: accel: adxl367: ...


> Replacing zero-length arrays with C99 flexible-array
> members since they are obsolete.
> Use the new DECLARE_FLEX_ARRAY() auxiliary macro instead
> of defining a zero-length array.
> 
> This fixes warnings such as:
> ./drivers/iio/accel/adxl367_spi.c:38:6-17: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>

It isn't a variable length array so the heuristic that provided that warning is wrong.

It could be switched to a u8 but then the code would be slightly harder to read
as the functions it is being passed are typically used with arrays - this one just
happens to only be one element long.

Jonathan



> ---
>  drivers/iio/accel/adxl367_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/adxl367_spi.c b/drivers/iio/accel/adxl367_spi.c
> index 118c894015a5..9dc61cb45fc5 100644
> --- a/drivers/iio/accel/adxl367_spi.c
> +++ b/drivers/iio/accel/adxl367_spi.c
> @@ -35,7 +35,7 @@ struct adxl367_spi_state {
>  	 */
>  	u8			reg_write_tx_buf[1] __aligned(IIO_DMA_MINALIGN);
>  	u8			reg_read_tx_buf[2];
> -	u8			fifo_tx_buf[1];
> +	DECLARE_FLEX_ARRAY(u8,			fifo_tx_buf);
>  };
>  
>  static int adxl367_read_fifo(void *context, __be16 *fifo_buf,

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
