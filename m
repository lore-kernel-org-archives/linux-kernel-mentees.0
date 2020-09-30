Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E79C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 07:17:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE4612076E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 07:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz3y20dj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE4612076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 33C1185F4C;
	Wed, 30 Sep 2020 07:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8UQ0J4nyElB; Wed, 30 Sep 2020 07:17:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E10EF85F4B;
	Wed, 30 Sep 2020 07:17:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD4DEC016F;
	Wed, 30 Sep 2020 07:17:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0286C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 07:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC2F887001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 07:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVHnWYBFPeYE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 07:17:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4673286F66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 07:17:02 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id l18so385299pjz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HvB5WWDeCpx4UxR7469lckPwvo+OJ9mvkcjL6Dnh5Es=;
 b=cz3y20djppMM1e+O0NQd3T9TUu175fFor7dMRlKW8evtdkP9ij7Mv6pVrnc65HDa5l
 IiQRZrbfI2PBy4HxXsqRJwldR8nks5NWfJ7JDpt3gOenJzSo+0ku7py9qj1pfGDgDgX9
 hIZg1E1/NuZhV5AvDsOwcnvQZpQaUcJ7tyc2gAtbz6zH961mwlViPt3GDRUMxyq3F/EU
 DPIFjE/6lkd37HnMu//PZ7awQl3cpq9S6UKS+SZci6j7avpbUUcsL2mV9dbxTjLHr+0N
 sddd6G2EBO++3ivQbQQe+CGLjpIAzIdbR4z9UbN9RgsfAt1zFPsWV4bfRI0x37hDid9d
 /raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HvB5WWDeCpx4UxR7469lckPwvo+OJ9mvkcjL6Dnh5Es=;
 b=BfcU+Nc6T88xcMCAqNp4wTlbbSco0GX/g7f/VpwugkVUwZia9zlLj0bEmqFEooFwDU
 B4JZ08beUHXs6s2zcKM8N8uVjHwBGO9kJ/kJcEPVzmlxo894Phm3wQv4jZtnmbdSZyHk
 pJsyCRAGk95K6LvYxld4Yf5UawEq4EGrXE1zyeRiDp9zFGBplumnoA6qVT6ayJJmI1J+
 DID79CBzRYLP5jZeULVBIV+vQgI6VV58iEqwWZBPIwBRmsZnvyesFhrrKApZGlv4DeZR
 Q1HfIAkl30cmUB6q8bsvJ8zxcKYs6bQ38DaSpN7v3022PvFYf/vbv0KOCs5UbnLNuEG7
 O9WQ==
X-Gm-Message-State: AOAM531cUIwO0CLZPkgw2CRiNDFSCbSYOZljwwdYG0eoxKAzmVwneTKO
 6pcwzdlzBVNr9I8msjBhXA==
X-Google-Smtp-Source: ABdhPJwwhqS/oKgZ2gCgTtB/SwDO9Ox+IW1ZuQUaTukVj7RoNvgQyRu6dyqlZGMOEx3c95YBXvzTtA==
X-Received: by 2002:a17:90a:9704:: with SMTP id
 x4mr1361295pjo.20.1601450221896; 
 Wed, 30 Sep 2020 00:17:01 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id l10sm1034278pgp.25.2020.09.30.00.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 00:17:01 -0700 (PDT)
Date: Wed, 30 Sep 2020 03:16:52 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <20200930071652.GA1152625@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <7d341242-9612-d0ee-4b79-e93882fad73f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d341242-9612-d0ee-4b79-e93882fad73f@kernel.org>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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

On Wed, Sep 30, 2020 at 07:26:52AM +0200, Jiri Slaby wrote:
> On 29. 09. 20, 14:34, Peilin Ye wrote:
> > the work in general? I couldn't think of how do we clean up subsystems
> > one by one, while keeping a `console_font` in `struct vc_data`.
> 
> Hi,
> 
> feel free to change struct vc_data's content as you need, of course.
> Only the UAPI _definitions_ have to be preserved (like struct console_font).

Ah, I see. Thank you for the reminder!

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
