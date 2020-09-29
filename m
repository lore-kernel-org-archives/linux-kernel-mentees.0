Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86493C4346E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 09:45:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF21208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 09:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIxjL/9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF21208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 43E6720780;
	Tue, 29 Sep 2020 09:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFelpgFkUndF; Tue, 29 Sep 2020 09:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82F6420467;
	Tue, 29 Sep 2020 09:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73579C0890;
	Tue, 29 Sep 2020 09:45:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB559C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6F4E85116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEiFB3fknbps
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:45:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4130D85108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 09:45:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o25so3442178pgm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 02:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GjNJiX6u6EA7eCAwaVO4jYqA+BXpH7vsjCBaaqrjlA8=;
 b=rIxjL/9RpTiJTUUFnwxmMMYOivzFHiq515t+RsiYdY6dT+h2GOWFuXkti572v4SAGR
 UmH9cCZG3/qonGEPbAWTzfgRtTLIdzEB+aeL5i3uaGmSrq+IqvmarqckwSBcg3+R2Z6u
 anaZadOfqIswrlR2BCehr3EatM8iB2OMkHB/EtXEEMZhQMQSZmcIzo/1F9pDOf4j1v2L
 qCLxLcw6FNuXoTl7207NrZUIueG93Qc0/UjN8WCgSyXrQWnG8aUH6uNOUM869MI9+imP
 6qgbzeuLw6r6m1+Fv6Oaowj44IG9uFRMkHkPil0Z9KraN5Jfd1zlXmdL9R15EP8Cy3U/
 4rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GjNJiX6u6EA7eCAwaVO4jYqA+BXpH7vsjCBaaqrjlA8=;
 b=f4lHsQidPvrkPgbhqLU82xyitMJGQwxjrhDBX377t2FY9z7EFYBhUs4oJnwpKfcHBm
 jzA2tS7RhuBVaJyqSBMXzvWuiork0UEkXCcjGYGftIwMh/ho1UMYtH4VXEAjxaFoFbSp
 aRHXEf2PMwCZlE+677DJHkoKU1T5Bi3lpGUBJSAnWDGFZhX14n9aLQ5yoxRsNM2n9B5C
 oRqJrr6Rfc/cyW7Suyw4b3Wmi8jKzHzInVOBL3iliT0zVRgvepQCmajozsA99mNb2LcU
 7RgkzceK/yeuBd7Vw9VzDmL1mvbqAG1zFGqs5FUVzPiPJD8jl3HOD1i+Itp3z3x8kIMY
 aRdw==
X-Gm-Message-State: AOAM532lN37S4nniUSbeqnPqBF0n+nMMsFcZKyauQUUgFmIveF0wqudp
 uGReabofZV8a6NBYVOeVWg==
X-Google-Smtp-Source: ABdhPJwdIxwVS1bO6zBzLCzQiN9q63SxQYJU2R5dXf10DiEk1uWsHbyMV9xL37r9CgP/NLOyo+JvYw==
X-Received: by 2002:a63:50e:: with SMTP id 14mr2553275pgf.443.1601372700871;
 Tue, 29 Sep 2020 02:45:00 -0700 (PDT)
Received: from PWN ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id l79sm4674865pfd.210.2020.09.29.02.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:45:00 -0700 (PDT)
Date: Tue, 29 Sep 2020 05:44:52 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20200929094452.GA1137889@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200925153509.GA895804@PWN>
 <20200929090945.GH438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929090945.GH438822@phenom.ffwll.local>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
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

On Tue, Sep 29, 2020 at 11:09:45AM +0200, Daniel Vetter wrote:
> If you want to follow along a bit I think would be good to subscribe to
> the dri-devel mailing list. At least for all the fbcon/fbdev/gpu stuff.
> 
> I don't think there's a dedicated list for vt/console stuff, aside from
> Greg's inbox :-)

Ah, I've been checking lore.kernel.org/dri-devel/ once a while. Sure!
I'll subscribe right now :)

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
