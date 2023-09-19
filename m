Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF5CCE79A8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Sep 2023 21:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEE3E40432;
	Tue, 19 Sep 2023 21:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE3E40432
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLQ7y4GR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91LBqeAPUC7N; Tue, 19 Sep 2023 21:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9CA7A40376;
	Tue, 19 Sep 2023 21:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA7A40376
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76549C0039;
	Tue, 19 Sep 2023 21:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61E78C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 21:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3619740396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 21:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3619740396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auoCNNcgnYGe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 21:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1FEF40376
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 21:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1FEF40376
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=f5/fMBSIznIr+vGvXU4rmAhmq+8j0wlA0K01HLKQFAk=; b=vLQ7y4GRj4HN8CPHKXs7DDUYk7
 Sd7EIIkAz3j/advHMGwNIZ/P8P5y7lt/s7IAHQK5W9SLtqj984StvmdcIoAqi+S1k/8Lnr6kpcyXo
 Y00GBqfbkvVQ/aBLQx1y1/dKzBrjU1A60/TSsH2cDIw6V2VVliTksjLwM2lSEGpnDZEhko9SjUn/T
 ggKhpRhTEzyLWqK8RagH9DQ8589VzHUXlc7+2IEFvmXrU3FG3bhJu/J3yxnWQe1A3AuVgWhyF7giM
 Ep28IzN6HTN6pnmLwRgkzTi4pSTuiI9XyW8VUQEnFUMSdfub5Yg5ceWb9kdFTXD5cDPZdk5zSlmsN
 mDjYu8cg==;
Received: from [2601:1c2:980:9ec0::9fed]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qiifx-001K5G-10; Tue, 19 Sep 2023 21:54:33 +0000
Message-ID: <e1294905-b867-4141-87ff-2b7202476e59@infradead.org>
Date: Tue, 19 Sep 2023 14:54:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: amd: display: fix kernel-doc warnings
Content-Language: en-US
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

On 9/19/23 02:33, Swarup Laxman Kotiaklapudi wrote:
> Fix kernel-doc warnings discovered in AMD gpu display driver.
> Fixes these warnings:
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
> Function parameter or member 'overlap_only'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
> Function parameter or member 'bottom_gain_mode'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
> Function parameter or member 'background_color_bpc'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
> warning: Function parameter or member 'top_gain'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
> warning: Function parameter or member 'bottom_inside_gain'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
> warning: Function parameter or member 'bottom_outside_gain'
> not described in 'mpcc_blnd_cfg'.
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>

Thanks for fixing these kernel-doc warnings.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 8d86159d9de0..61a2406dcc53 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -91,6 +91,12 @@ enum mpcc_alpha_blend_mode {
>   * @global_gain: used when blend mode considers both pixel alpha and plane
>   * alpha value and assumes the global alpha value.
>   * @global_alpha: plane alpha value
> + * @overlap_only: whether overlapping of different planes is allowed
> + * @bottom_gain_mode: blend mode for bottom gain setting
> + * @background_color_bpc: background color for bpc
> + * @top_gain: top gain setting
> + * @bottom_inside_gain: blend mode for bottom inside
> + * @bottom_outside_gain:  blend mode for bottom outside
>   */
>  struct mpcc_blnd_cfg {
>  	struct tg_color black_color;	/* background color */

-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
