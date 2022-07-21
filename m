Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DD1C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Jul 2022 17:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D4141922;
	Thu, 21 Jul 2022 17:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3D4141922
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HaQMMf/l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PHqZiu2rgEpt; Thu, 21 Jul 2022 17:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A0C7341710;
	Thu, 21 Jul 2022 17:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0C7341710
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D8FBC0033;
	Thu, 21 Jul 2022 17:41:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8376C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 17:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CC7040445
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 17:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC7040445
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google
 header.b=HaQMMf/l
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgWqoQFDN-tw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 17:41:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD38400A8
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CD38400A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 17:41:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v12so3045442edc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jrOYLEhcS0420xmVQthPyRSyBJPZ/EqshTnmV/2s3/o=;
 b=HaQMMf/lNG/g52eo3gYTsJdE60j17zx7piC5a1J+s9dbt/vdM1VejF+7jojw+wO3/N
 mtFIH/xngKCKZPh+SVIBBgXN6v7W7wdzeW2e2CK2BamcBsKmAZWsOPsXHqs3z/H7+RLZ
 n0ndHCmXYVLy9DnzwZjQrfJ5qVBMimGwmQAjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jrOYLEhcS0420xmVQthPyRSyBJPZ/EqshTnmV/2s3/o=;
 b=6Cxx//XlFpabF5Ak5KRLJEZrYysIU+DNAkD/wvzRVmTPj2osn5cv29ut6SSxnwi1PQ
 VGsQgA14mmBS4ThouK6tmEEkC70sMRM5Z71OMOjhXUrc3FF/LiZcKXEWuYKIn4MYOHpm
 s2Sl5Y17hbDfUIpk9JHewLjjZpxNXkEYGIJl/oLIH4cyAxkbXU3kTJtirjJpuCrprVuu
 +8sMZVMYutpaXGhGNzXr+RwSzKAB5AdJORIhzdzEf34L+2Imq3fYKpA2JsbRevSIkVRO
 KxsoIh6e8L60VRO05hQ4m0BkaquKjZ5/FSbNeYZUZedpIpXoQGSlvAnfFK56oH3/6jRt
 kExQ==
X-Gm-Message-State: AJIora9WceUMNaQNA3k/U/ttMUwksFDJr1RIMera5HJRkuP07/BOSlX+
 ohftCV3U09GXKmwyWZBaxtqwJ2ODIAjhkX4GGCc8vg==
X-Google-Smtp-Source: AGRyM1vnYx1vU5IcUIO84Ogl6OmS8Z25VQm/TLLbV3W6ajQjBIhJCIKNRWQSBlsePHTmIq79WychKg==
X-Received: by 2002:a05:6402:3046:b0:43b:c9c1:864e with SMTP id
 bs6-20020a056402304600b0043bc9c1864emr2926089edb.32.1658425307151; 
 Thu, 21 Jul 2022 10:41:47 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b0072ab06bf296sm1086259ejg.23.2022.07.21.10.41.45
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 10:41:46 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso1209231wmq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Jul 2022 10:41:45 -0700 (PDT)
X-Received: by 2002:a05:600c:2211:b0:3a3:2149:88e1 with SMTP id
 z17-20020a05600c221100b003a3214988e1mr9253524wml.8.1658425305550; Thu, 21 Jul
 2022 10:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220721093042.9840-1-khalid.masum.92@gmail.com>
 <CAD=FV=UbRX194rDztr_=eoALg4kTmjzq=EXCX6RJSSq3vO=fbw@mail.gmail.com>
 <Ytl/xkb9OC43dgJd@bombadil.infradead.org>
In-Reply-To: <Ytl/xkb9OC43dgJd@bombadil.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Jul 2022 10:41:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDsUDBeLWfFXTWSQcAGq9YS5gjMeNe-1KpXmyo_RwG8A@mail.gmail.com>
Message-ID: <CAHk-=wgDsUDBeLWfFXTWSQcAGq9YS5gjMeNe-1KpXmyo_RwG8A@mail.gmail.com>
Subject: Re: [PATCH RESEND] scripts/gdb: Fix gdb 'lx-symbols' command
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Pavel Skripkin <paskripkin@gmail.com>, Aaron Tomlin <atomlin@redhat.com>,
 Kieran Bingham <kbingham@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Andrew Morton <akpm@linux-foundation.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Jul 21, 2022 at 9:33 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
>
> This should go to Linus prior to the next rc.  Linus, I think this is
> worth picking up now as I smell a final release soon.

Applied. Thanks,

               Linus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
