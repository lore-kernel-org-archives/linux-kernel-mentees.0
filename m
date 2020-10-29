Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CC3C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 15:48:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382372076B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 15:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QipC0ZCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382372076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F96486CA6;
	Thu, 29 Oct 2020 15:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lI20bS3VKNj5; Thu, 29 Oct 2020 15:48:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 373FB86B94;
	Thu, 29 Oct 2020 15:48:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BC3EC088B;
	Thu, 29 Oct 2020 15:48:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCC32C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B79E287562
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezNqwNdP2+pH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0C09D87560
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 15:48:19 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n11so2698466ota.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mL45j0ThPWSBPTD5qqxEjd3SM3ZqTKpA4rZRq7/2j8A=;
 b=QipC0ZCiXzYjKpEvbx+RG1Gv4l+ezy0bpPz5zhqRC7E3uO5NJ9LHbynDrtWLmyCNhE
 eRO9G2EFKQ45RP0ZhDunGQfuZA7ICEuWYPCU3JrASB9VxMhZqIySord1X48D7N9wV+at
 LSYdtfT6czhOEvLExIr7uphpHVIxrFzl/NQwap2jSeqXg3zAKMqWvtNCKcS9wILggDIU
 /6GKWEh2sVdRdxyw1Dg/rY1eOdWr10VNKb0Kn0gtXcsCoKmCqfdck7Rv3rxvkHzSJVH7
 7O4Fv7vQTXx8z/5SjGWlSta0Fi1ozW6AjChO9zLO5ptiNES0WqNEhoQ7k6WxtPFZMjDR
 Fe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mL45j0ThPWSBPTD5qqxEjd3SM3ZqTKpA4rZRq7/2j8A=;
 b=Iz/c6Gjxudf3lOrxWuAmfFh9FnSz1FnjOlMeU9bi6jXMcGlIr5vYGNcIrhxEujpTeU
 BTdmHWqU/IM9xkuZ9gHqmm7y3KrfjC6dGHcc4U/S/OfLiUPS6ing5hMS6pQLEMViIB8s
 Rw6aUCLJUQCeCzi/fWmx/ioF349B0y064q6BCwiLfaVXwBKP4oHydOFViAa4Sw/OLCS9
 uwe4I/vrpWOCGupCn/VMV1gm3q+nq69EMHiIC2S6LtoJJ/O4hgUTWeW0oVH7VSBeCQ/M
 ywG6JHVyh5oNsa3eHEg8/6LF5WklTxZcL2Zgq2QaB039CCXb77k+SEecFJv0Qffzpvwc
 QuOA==
X-Gm-Message-State: AOAM533LfTguBg2ShOU9CWV3n1CRnt+F0SUeVD3+tBAewdhCjt8wYBgj
 tpDedfUhui5hWA0fkMIgr9rrg/Rk0owYdZ0i8pY=
X-Google-Smtp-Source: ABdhPJwhRxBY6hlW5yyGMigXqNZ8etvmSfqvlI8DgAh3b/Z9xVULHDIk3oP1tm55/7Nyva2evhwAFE80fHXB8Ml8jOo=
X-Received: by 2002:a9d:7cc8:: with SMTP id r8mr3954348otn.30.1603986498158;
 Thu, 29 Oct 2020 08:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
 <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
 <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
In-Reply-To: <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 29 Oct 2020 21:17:47 +0530
Message-ID: <CABJPP5CWehE68jJVo5MUha0VxMVvV86pNCOB2w5-gsyWA9g8MA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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

>
> Hi Dwaipayan,
> I have generated reports on v5.0..v5.4.
>
> Relative change in warnings/errors before/after your patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task4/relative_summary/summary_relative.txt
>
> Dropped warnings:
> https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task4/relative_summary/dropped_warnings
>
> There may be some discrepancies due to multi-threading. But it should
> give us a rough idea.
>

Thanks Aditya.

Seems like 763 false positives were resolved successfully.
So I guess the patch is working as intended.

My evaluation is currently running and might need a few
hours more. I will share it once it completes.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
