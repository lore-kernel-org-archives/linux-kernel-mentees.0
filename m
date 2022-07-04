Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656CDC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Jul 2022 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA35640635;
	Mon,  4 Jul 2022 13:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA35640635
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BOkXi0UN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCxfAafuNxWK; Mon,  4 Jul 2022 13:23:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F0F99405EC;
	Mon,  4 Jul 2022 13:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F99405EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE06AC0032;
	Mon,  4 Jul 2022 13:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88389C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62D1160E16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 13:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D1160E16
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BOkXi0UN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzdT4-7R9LUy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 13:23:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92721605A0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92721605A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656941021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=++fJgtu1Gsy4nJVDDaNos/TBbdlOhBzdbNWHZ5EkqwY=;
 b=BOkXi0UN+JdRgN032nBhIKmB2oaUzOytPqptCFcaSVM649wSYLMp53uXLiGi83SpCjAWfK
 pRN0/NnaE/UPgFeEccDELgY/mibl135+pl124kr4mBIINyUe+2anKc4D+YeonC7deijtU4
 Ssz4JVrky461j6zxEnQ6P7gCU0zqUrg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-6YmxFcvXP4a1I4cyhv2CJw-1; Mon, 04 Jul 2022 09:23:40 -0400
X-MC-Unique: 6YmxFcvXP4a1I4cyhv2CJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v16-20020a056402349000b00435a1c942a9so7251747edc.15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Jul 2022 06:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++fJgtu1Gsy4nJVDDaNos/TBbdlOhBzdbNWHZ5EkqwY=;
 b=LoBdPxCEA8bbqzjIOs2ojNt1CBUqAstPDDgb4yuqq4MlHza4Zz1vjhFPSvSUomvvj2
 zl2JP2tx96l2o9RdURuqCX2i9gDXD60aCPF7Vb/yO/GBanEgiOSWMqL1l1sllpZGQNma
 DFIBloUjh0VDkeYRu8HGMqZJabAp47xq6o7l85Rd75rBuJcCnSdsw73TCNdhyMln5TeM
 06yacPKx2GhcFiVg5YZhzxr83sN5wobl6b77rKkYxuVNjJDUjR9xBUc0rdjJswkt6HEM
 nppHF7rmD1gEVhKfaalwvxAJK/BBMMJ+3wF6d9F36oROMjyeVeByp99+2TT8JF5dg6Ar
 tiOQ==
X-Gm-Message-State: AJIora9Gw1LMCiwxnu3yXPysxAuNFTZ+aKiEgASbCVWuqVsvI1c6S6vh
 IWGLpe3K1rjXcn4mQ/GpkY0TRF4gGtq3NMPG7qgbd8IHO8BzhvbYivsKFIrZWYu2TbJE/P5xcT2
 GN6SgCR/GPdWyQDP2X12c6f5X8lykXpK6+nqHEi4CZy9nE73JzfjBQ/JEA7Ojh3Y1
X-Received: by 2002:a17:907:1dea:b0:72a:6012:7bbc with SMTP id
 og42-20020a1709071dea00b0072a60127bbcmr22739735ejc.258.1656941019233; 
 Mon, 04 Jul 2022 06:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1us+BJZNsaBxoVlhuOHsDmDB0TuEnxFOGCQHinJXmpvFVRGrl2Z3hyJhPYMWd9HALphgmfV9qcRQ2n0jxT4UXk=
X-Received: by 2002:a17:907:1dea:b0:72a:6012:7bbc with SMTP id
 og42-20020a1709071dea00b0072a60127bbcmr22739720ejc.258.1656941019093; Mon, 04
 Jul 2022 06:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701142515.14800-1-code@siddh.me>
In-Reply-To: <20220701142515.14800-1-code@siddh.me>
From: Vlad Dronov <vdronov@redhat.com>
Date: Mon, 4 Jul 2022 15:23:28 +0200
Message-ID: <CAMusb+QLOyOmk-MQ=FJV7N19g17TUb0gyBi522Rna1uTR9S2+A@mail.gmail.com>
Subject: Re: [RESEND PATCH] MAINTAINERS: Add
 tools/testing/crypto/chacha20-s390/
To: Siddh Raman Pant <code@siddh.me>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vdronov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Jul 1, 2022 at 4:31 PM Siddh Raman Pant <code@siddh.me> wrote:
>
> This adds the maintainers' information for the
> s390 ChaCha20 self-test module.
>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
> CC'd the maintainers in this enail which I had not
> done last time.
>
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe5daf141501..0fcacd715b1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17438,6 +17438,14 @@ F:     Documentation/s390/
>  F:     arch/s390/
>  F:     drivers/s390/
>
> +S390 CHACHA20 SELFTEST
> +M:     Vladis Dronov <vdronov@redhat.com>
> +M:     Herbert Xu <herbert@gondor.apana.org.au>
> +R:     Harald Freudenberger <freude@linux.ibm.com>
> +L:     linux-s390@vger.kernel.org
> +S:     Supported
> +F:     tools/testing/crypto/chacha20-s390/
> +
>  S390 COMMON I/O LAYER
>  M:     Vineeth Vijayan <vneethv@linux.ibm.com>
>  M:     Peter Oberparleiter <oberpar@linux.ibm.com>

Honestly, I'm not quite sure this is really needed. test-cipher.c is a
"one-shot"
thing quite exactly and it is not supposed to be changed / developed anyhow
in the future.

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
