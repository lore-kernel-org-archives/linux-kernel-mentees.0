Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F7EC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 15:09:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCDA2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 15:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmcdvitI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCDA2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD2C786E3F;
	Tue, 21 Jul 2020 15:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8X5KX8LJryh4; Tue, 21 Jul 2020 15:09:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 81C1486E3B;
	Tue, 21 Jul 2020 15:09:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70DC1C088E;
	Tue, 21 Jul 2020 15:09:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85177C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 73D6986E3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBcfttXkSknH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 229638690E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:09:45 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id k1so1709613pjt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eoQ/LwxD/ih1GkSzZAuNDCG4MFgTBugN1T3/2DGPiZs=;
 b=KmcdvitIPM0ZFS7BiZAORytFknRF/NJjqwGhXJbcpyxRU5OsqYeFLMZBj7ZTICExgy
 QuzRkzTZlNMRcaqFb6yBkA1qKLOjKL3YvNFmeK+GiI2VI+UkKVbQDs+8D4oJSBPeUfio
 O60k7atldaQEfVM/eKAL52AIZkGkqgIaka6IV6wYrVZJJxxYn6bKNLnPru+gph7D44zT
 mFqXyyg7VLSctQnF0GY4kjhufYXEc3BmPiJuRbSM6mEfabaDcchfbcIN/W0G6vwyYVBb
 0cPUwTWccn+x+bDjxlzEyCBodaTCUHGo4KJxMufcROGt9iy/ySVyvWZPurM2Utyxr6rV
 FAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eoQ/LwxD/ih1GkSzZAuNDCG4MFgTBugN1T3/2DGPiZs=;
 b=ucQbrWKHcMQSyUM9nSFsO25ouHMamf9y2CcKlfC9+F7kJUDN65Mss1GrL0YTTuk/jm
 0lKqHbXmaxvMpyHet3ua996c2vxgb6xaCb+v9kRfcJpirSsd5XaozZRjUUSr+pO/P7rv
 PFUdd4oTjs0yCmCREex7A0vxmA1Ts96FD9kVrBwf5pzBeolZ4hi/3XuygYtxPysVdUgS
 YW0DRJGwrJczNd4+e2fGj/HVBKMF6WXZ8Ge8ogB6F+xEFd6RKbjAUtzU0kyXPwuI0UNg
 MXfxLOgOp05qZGouwtdA5nWLIR32qHdDuJ+MAxAGY1dsSZ19M73JATaRvyX+mzGbFVqo
 /SeQ==
X-Gm-Message-State: AOAM533KZfZ67JduLwlgm0LZyjueOGV4rAOOf/S/Bn9Poxs6WmoE/ZCZ
 Otm4Ee/602L0atdztpvP7kc=
X-Google-Smtp-Source: ABdhPJz4/0wCZf0XMDAqiQz3adVwsAM+1tFiAJD4fUtW8v8r/Z0JnQYCFnNIOeXwwXGt/iVKX/DjuQ==
X-Received: by 2002:a17:902:ac88:: with SMTP id
 h8mr20461966plr.220.1595344184727; 
 Tue, 21 Jul 2020 08:09:44 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id 22sm20312399pfh.157.2020.07.21.08.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:09:43 -0700 (PDT)
Date: Tue, 21 Jul 2020 20:38:18 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jouni Malinen <j@w1.fi>,
 Kalle Valo <kvalo@codeaurora.org>
Message-ID: <20200721150818.GA371967@gmail.com>
References: <20200721150547.371763-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721150547.371763-1-vaibhavgupta40@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] hostap: use generic power
	management
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

This patch is compile-tested only.

--Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
