Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A976C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 05:19:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061442145D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 05:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xe4Ftg6f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061442145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC6DB86FEB;
	Tue, 29 Sep 2020 05:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZXyASIeToii; Tue, 29 Sep 2020 05:19:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38E5486FB2;
	Tue, 29 Sep 2020 05:19:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 178C8C016F;
	Tue, 29 Sep 2020 05:19:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65ADAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 05:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B5CD2046A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 05:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RVgAkO5cepzN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 05:19:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C5F120368
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 05:19:31 +0000 (UTC)
Received: from coco.lan (ip5f5ad5bc.dynamic.kabel-deutschland.de
 [95.90.213.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C60B42145D;
 Tue, 29 Sep 2020 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601356771;
 bh=Jkqd0x9y1qCqf4dEAyGH6DAakth8ael+GUF3gD5Y6yM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xe4Ftg6fNu8TtjnFW5XlS6N3U6x+Jefb2Frpk6OW9otweRVse7t9N555j6aDwjkTg
 ujzDx5GQTBjp8cUKyKhkOqHW1BYYAcG/rGo6OGsri7zLxKaw5NMtAVYbL/emfw95Va
 hXuhDVnhwYNtljsas4TtLqV4lV2BHQ5PVkGnZ65s=
Date: Tue, 29 Sep 2020 07:19:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200929071918.15c018ac@coco.lan>
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: r.verdejo@samsung.com, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH WIP 1/6] media: vidtv: extract
 the initial CRC value to into a #define
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

Em Tue, 29 Sep 2020 00:26:20 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

On a very quick look, patches seem good. Why did you mark them as WIP?

Next time, please add a patch 0, specially when you tag something as
WIP, or RFC.

> 
> The same constant (0xffffffff) is used in three different functions.

This one at least seems to be ready for merging ;-)

Regards,
Mauro
> 
> Extract it into a #define to avoid repetition.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_psi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 3151b300a91b..a24e84adc8ce 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -30,6 +30,7 @@
>  
>  #define CRC_SIZE_IN_BYTES 4
>  #define MAX_VERSION_NUM 32
> +#define INITIAL_CRC 0xffffffff
>  
>  static const u32 CRC_LUT[256] = {
>  	/* from libdvbv5 */
> @@ -794,7 +795,7 @@ u32 vidtv_psi_pat_write_into(struct vidtv_psi_pat_write_args args)
>  	/* the number of bytes written by this function */
>  	u32 nbytes = 0;
>  	const u16 pat_pid = VIDTV_PAT_PID;
> -	u32 crc = 0xffffffff;
> +	u32 crc = INITIAL_CRC;
>  
>  	struct vidtv_psi_table_pat_program *p = args.pat->program;
>  
> @@ -990,7 +991,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
>  {
>  	/* the number of bytes written by this function */
>  	u32 nbytes = 0;
> -	u32 crc = 0xffffffff;
> +	u32 crc = INITIAL_CRC;
>  
>  	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
>  	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
> @@ -1143,7 +1144,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
>  	u32 nbytes  = 0;
>  	u16 sdt_pid = VIDTV_SDT_PID;  /* see ETSI EN 300 468 v1.15.1 p. 11 */
>  
> -	u32 crc = 0xffffffff;
> +	u32 crc = INITIAL_CRC;
>  
>  	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
>  	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?



Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
