Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E01210B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXRjFq8T"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B45781DCA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B45781DCA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JXRjFq8T
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFCnKcBry1by
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:50:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 15B4681D0B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B4681D0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQwLyxRVqkJ+kYuszxuoBP5x10ugdyX648DqZogP1FM=;
	b=JXRjFq8T0xaGCLeQTd2t3CXDy7BtNy/Zw7gGTajAWpnZwFPcMdCIOdK6Ngowe7hWY3ymTt
	455x0ITjr41s6+SjRmfUNeU4bZqAX52XBB0NTOcuWq6SFuUerxSpV//982n/0ZYkQiuIL3
	6qYWzSNvtpPeYIxVgYLJ/lekKMxugd8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-4t-XEu60NGCqxVoedeqzXg-1; Sun, 31 Dec 2023 04:50:12 -0500
X-MC-Unique: 4t-XEu60NGCqxVoedeqzXg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e69fc4574so5366004e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016211; x=1704621011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQwLyxRVqkJ+kYuszxuoBP5x10ugdyX648DqZogP1FM=;
        b=BvRl7WpwyoNk1NInk5vlejLyHBTCH0Y6sxMwPJ43v6kYi5obLHvuavzuN2piZr/EHy
         7bWNFeedaWtRxKjehtv2J9hUwRBgLYlvXBULt3k9i2EU4tTIEF9iZFGgLMbVUadju8J/
         0p4+XDQLxuzjMMQRt96xcZOr5jJQbj4R2PeZBdgswed/fhwecr6CK6NwmxKU/+mYuz9g
         SUiyAf1UBcAd0Rt0UXMib+K6Z4M3BwKvwFfZpduFjH6URLRNucmtHCuquqGJcjUKawRN
         hD+43f2pluxq2A1m0SHLCgsq9MKon6JbRUR0IrWIsPP5MGkoKzHE7xweNbqC3FPd+vxd
         WNHQ==
X-Gm-Message-State: AOJu0YxqsajE/N+j8Mfkz1nlSyeHJeVE0/BXijjmBtvJOHCXm7tlm05h
	pA2x0thgCauvYrJJ4I1q7ap/xNjhxbQuyLizAoaFiLA4cjRntbKkGi8Bms2k7TKKOgIv97BwH+Y
	VQruunserVOYHs3kZW1C9Q0Yu4QRknZ0Ripetxp7ZAnkvFSu69o6KXTtq
X-Received: by 2002:a05:6512:60c:b0:50b:f7bb:4545 with SMTP id b12-20020a056512060c00b0050bf7bb4545mr5402828lfe.68.1704016210845;
        Sun, 31 Dec 2023 01:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGTXOS5OP/7s7cUFSpzRSVVhXB+zVNEwUzKcKkS6C7M/kHt9/vMcvTNZsWjUlh3SL2wFNvaw==
X-Received: by 2002:a05:6512:60c:b0:50b:f7bb:4545 with SMTP id b12-20020a056512060c00b0050bf7bb4545mr5402823lfe.68.1704016210671;
        Sun, 31 Dec 2023 01:50:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:10 -0800 (PST)
Message-ID: <c66ced4c-3f42-4eb5-b247-f6abe75e5eb0@redhat.com>
Date: Sun, 31 Dec 2023 10:50:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/isp/kernels/macc/macc_1.0: Fix
 spelling mistakes in ia_css_macc_table.host.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223081354.83318-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223081354.83318-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 09:13, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in ia_css_macc_table.host.c below:
> 
> '''
> ./isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c:22: matix ==> matrix
> ./isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c:39: matix ==> matrix
> '''
> This patch fixes these spelling mistakes.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  .../pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
> index 946b074e8288..d25bf59273ba 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
> @@ -19,7 +19,7 @@
>  
>  /* Multi-Axes Color Correction table for ISP1.
>   *	64values = 2x2matrix for 16area, [s2.13]
> - *	ineffective: 16 of "identity 2x2 matix" {8192,0,0,8192}
> + *	ineffective: 16 of "identity 2x2 matrix" {8192,0,0,8192}
>   */
>  const struct ia_css_macc_table default_macc_table = {
>  	{
> @@ -36,7 +36,7 @@ const struct ia_css_macc_table default_macc_table = {
>  
>  /* Multi-Axes Color Correction table for ISP2.
>   *	64values = 2x2matrix for 16area, [s1.12]
> - *	ineffective: 16 of "identity 2x2 matix" {4096,0,0,4096}
> + *	ineffective: 16 of "identity 2x2 matrix" {4096,0,0,4096}
>   */
>  const struct ia_css_macc_table default_macc2_table = {
>  	{

