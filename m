Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429E7C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 14:09:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A365921924
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 14:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2I52KOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A365921924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58E808539A;
	Mon, 28 Sep 2020 14:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQrUNFe5Rqy6; Mon, 28 Sep 2020 14:09:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12B6585701;
	Mon, 28 Sep 2020 14:09:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5E2FC016F;
	Mon, 28 Sep 2020 14:09:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C46BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4202787017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuAa58kSm3Dp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDEBF86FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 14:09:28 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e22so1480825edq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 07:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QAFuYSdc/z9mVy8zvTAetO3wIJKD7dWC6GXpc3owy4k=;
 b=l2I52KOL/AHAv0CqRkiXZe7llbI7RjnUWncUYikwKTd3X8qnYXVbbvwxUV7ODl8RtS
 Bjj8MwKg+xZ3ITVaPatunfyN2eGagYdhNsCF2J1TKi29oU91Xkt6vIKec5yQyhr6T+xU
 GQk22CdIQRgD+wOf5TU3rnyqsU92YYR7W36PUE8BSeqInMeZWlsh2Gu4/jVfe6GEUQMN
 ZebaU9DoZFCsqaRO1ByB8Ee/FFEYfaf2wScpLwVgmiWcm4Jm1SPy70NRABPLzQXinNhO
 wJUYKjdMBP/qCG41Y9hXqdPqAftUq7lc6RYWVjW1RUcpEARjbTvBKVdUF/UT1ajCAMOt
 HFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QAFuYSdc/z9mVy8zvTAetO3wIJKD7dWC6GXpc3owy4k=;
 b=BnJsps5leJlj/gCGRRekhRG93kD/fEarTS2YTtONi91KXGqHLB+LEcvwWce61STxZm
 G0017tspUi4OvDfAUVQZAxOFH+hKdl058YInYCrZpKlQTePIzTiGg6hjDG4sCTn1iwPH
 TklScpZGrIV0QKoop6aoYV89+Ztxu6jeBHMDgxsQOexLdVjydTy+vFwyICwYWM0Rle9s
 zSheNJgPbNjSqo8mM0C8TGBiFwqdXTxSaHZAUbo8IZTCNtfTcBUYmpaZQ+KVSph9twOF
 B4IUhmZgBx4LwKiEOKMTL5be4tbswS87X69QCcxTM+NN3ps1ZJgaD7UPCv+Zf8BBYL5I
 f6lg==
X-Gm-Message-State: AOAM533oS+j8J/DPsX7HKigtUPqrPiPbAeL+6GFkHyv9g0lzvYRwTYcg
 wYR8ntzz4zYWATMEJHwWt4c=
X-Google-Smtp-Source: ABdhPJwLMA6ze9BsaIwHw26qaVPEZ2RW6DeVk67Phm5C+kh+cUgi9yZP0IGuSZn5QpIYDovsccRLBA==
X-Received: by 2002:a05:6402:1548:: with SMTP id
 p8mr2046022edx.65.1601302167210; 
 Mon, 28 Sep 2020 07:09:27 -0700 (PDT)
Received: from felia ([2001:16b8:2d9d:5000:7872:7299:adfa:b749])
 by smtp.gmail.com with ESMTPSA id b10sm1433465eje.65.2020.09.28.07.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 07:09:26 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 28 Sep 2020 16:09:18 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5A46fh=Eth7RwXYHarcS11kyHMCUMrRfvvJ3_8oafAkJA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009281608130.4154@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
 <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
 <alpine.DEB.2.21.2009250930570.5992@felia>
 <CABJPP5B8mfAi3MMS4xWbArJe=FcMBTF9U8qvXmaicGj5WKiGBQ@mail.gmail.com>
 <CABJPP5A46fh=Eth7RwXYHarcS11kyHMCUMrRfvvJ3_8oafAkJA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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



On Mon, 28 Sep 2020, Dwaipayan Ray wrote:

> Hi,
> I am continuing this thread, but am writing about another issue
> separate from author sign off. While checking checkpatch
> output, I was checking the commits with the warnings:
>

How about just starting a new thread instead?

I will answer on the new thread.

Lukas
 
> WARNING:UNNECESSARY_ELSE: else is not generally
>  useful after a break or return
> 
> Looking into the referenced section, I found some
> sections with a redundant else.
> 
> For example: (revision 196273fffc1c),
> arch/powerpc/kernel/security.c , line 360:
> 
> static int ssb_prctl_get(struct task_struct *task)
> {
> if (stf_enabled_flush_types == STF_BARRIER_NONE)
> /*
> * We don't have an explicit signal from firmware that we're
> * vulnerable or not, we only have certain CPU revisions that
> * are known to be vulnerable.
> *
> * We assume that if we're on another CPU, where the barrier is
> * NONE, then we are not vulnerable.
> */
> return PR_SPEC_NOT_AFFECTED;
> else
> /*
> * If we do have a barrier type then we are vulnerable. The
> * barrier is not a global or per-process mitigation, so the
> * only value we can report here is PR_SPEC_ENABLE, which
> * appears as "vulnerable" in /proc.
> */
> return PR_SPEC_ENABLE;
> 
> return -EINVAL;
> }
> 
> The else is pretty much redundant and the control flow
> never reaches to return -EINVAL.
> 
> Is it possible to clean up all these redundant code?
> 
> Thanks,
> Dwaipayan.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
