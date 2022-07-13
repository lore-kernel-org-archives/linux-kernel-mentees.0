Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA98CCA482
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 03:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95C2F61356;
	Wed, 13 Jul 2022 03:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95C2F61356
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jp0EIugu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UytcBml8FrkW; Wed, 13 Jul 2022 03:36:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AE3CA611D7;
	Wed, 13 Jul 2022 03:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3CA611D7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9915CC0035;
	Wed, 13 Jul 2022 03:36:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44264C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D58A611DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D58A611DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kOqwIu6nYAo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:36:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523B7611D7
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 523B7611D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:36:16 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id b9so9126398pfp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jul 2022 20:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVeFSkEmO64ENxp6OwJH9yQxRclVRPX/S8GoXnifoJs=;
 b=Jp0EIuguvIfT6nTpvibnF455o2Z/zMNJF/YU9QGMqMtctxixq8+XSHucyOjWjqQB2n
 +zECdCdWCb+zQZSX8jz+e/vw+FTo+VrqRYmVjVszWH2e5U++Uyc5tT/ddZHYvdX8yhI6
 IPsonz+WmHSp0VL5xz2/J53mTXgp7AQtDuatWLTmNUTevQ8iIPaAvxceyqqHEraHqFYu
 sdbODjltqC7KaZw0Y1ZMT8y1ouyEsFMX1Xp7mGCe/hHWxB66b1/HyoCR6P0TME1HMhOw
 ReR/1DVExuDOruoz/R95CTcbQucfR5VY4zyn3ByTFzTMICA8F/+3yPnU04W2qOVPKPRb
 UC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVeFSkEmO64ENxp6OwJH9yQxRclVRPX/S8GoXnifoJs=;
 b=wfsuNndEv0sFyd5f7mc31ndL6ZQiEFZOxNlrYk5OjolGJDhbnVcUvEF+CZZLypwkuS
 W2VG7O60HULjcqAa0WBQ28TWiP97Hvy5IID9+ufQieS1Qf3FwbWaxFOnzkT2bwfVahHN
 sVZNEZaVV6qocphxHJxk5jUrirBdPEMr/3hplSldMv4Z0S9D1dV1wJtrof7GuLUzhpIg
 eAC3U77pzQlHh3wW9bL9zYPWrl7P/TSFHZsiYlyNy7MHo+AKwOXg/Ovt+EnPSyZlvFpF
 pB9kmhWaGJJxUtUMRrHsB4BZl7Tu6X9nLoTHRbNKfJZFe1dnCo56DMDe+x8OItnlLqMm
 R/jg==
X-Gm-Message-State: AJIora8ZDNUNBAHG9dfeX71IbygTPc0F0ETUv5rl+qU83S+R0+hqa1PI
 UdzaZIlDWL9qvVKDBURR6lo=
X-Google-Smtp-Source: AGRyM1vI+wluVcFYvR2WTFV2uiw4Hura3WhTgF/TWxJ+8Q2pOc6qb1PHNWWn2zoSTl80hHPro3mVwg==
X-Received: by 2002:a63:d1e:0:b0:40d:379e:bff8 with SMTP id
 c30-20020a630d1e000000b0040d379ebff8mr1289986pgl.215.1657683375679; 
 Tue, 12 Jul 2022 20:36:15 -0700 (PDT)
Received: from localhost.localdomain ([136.175.179.221])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b001638a171558sm7634084plg.202.2022.07.12.20.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 20:36:15 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: dan.carpenter@oracle.com
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Date: Wed, 13 Jul 2022 11:35:51 +0800
Message-Id: <20220713033551.59355-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712094745.GM2338@kadam>
References: <20220712094745.GM2338@kadam>
MIME-Version: 1.0
Cc: songliubraving@fb.com, yhs@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 kgraul@linux.ibm.com, guwen@linux.alibaba.com, bpf@vger.kernel.org,
 kafai@fb.com
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

On Tue, 12 Jul 2022 at 17:48, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sat, Jul 09, 2022 at 10:46:59AM +0800, Hawkins Jiawei wrote:
> > From: hawk <18801353760@163.com>
>
> Please use your legal name like you would for signing a legal document.

Thanks, I will pay attention to it in the future.

>
> regards,
> dan carpenter
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
