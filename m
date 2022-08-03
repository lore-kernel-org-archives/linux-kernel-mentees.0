Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9682C19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 12:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BCED40200;
	Wed,  3 Aug 2022 12:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BCED40200
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=om4Wa/1r
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8Z5MWGE54hE; Wed,  3 Aug 2022 12:08:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 60BA7400EA;
	Wed,  3 Aug 2022 12:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60BA7400EA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2460BC0032;
	Wed,  3 Aug 2022 12:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A901C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 12:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D82044010C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 12:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82044010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUFW1ySlrBrh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 12:08:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9023540200
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9023540200
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 12:08:10 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id u133so9600368pfc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Aug 2022 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9fp5p2RRC2dpvoo1tDP5el5OXyBtfs5poTm6BdmStyc=;
 b=om4Wa/1rhi7D4sw6Ye+RrMWITwxTd4qlemLacCr4YOgFwc0/3U43oZmPRLJm1Ile3Z
 h7ZSybt7jX8ndMJZfj1+aCIywadbGRa+/joLlrknoQrD/iFltB3T/dd3FA6GbR62CibU
 +935czWEOpe3BlNC6+d0wz3OuvWnBenz3C5ihl88PSDPaZk1GGyiSlTaBlpZ2u2k/pQT
 5tc70Wj85WGkAcWq6rQUKCHCKa6DKO5KzAf65vf5LxmBAHeFN5Hmwp5PAISQMIFAHj8n
 eL3XcfHVYwCp6BLz3rSs6W3OZqNOlxyShxrZyXStSbyEJ/1SgvwQCldOy+JRcmrjkEUC
 B1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9fp5p2RRC2dpvoo1tDP5el5OXyBtfs5poTm6BdmStyc=;
 b=Ni5DnEaO5lBPzTNvtmnOH47P4ZJ9IqMGjjka5CvwWafWGqfPg8oTRLCbXG6lSMZ132
 pHyNNcNFner3/x3QWHfcYLl+Z0Nr2/H6fFPMbjcfYGrKzDHTTFkDK92M+hsLIyZn1oVc
 JBUpFxN3SNeds9xlrCet8eVEnkdBqNOVZkckw96Qkexr2ZPG+b3RaDl5v2qv0Ydy/pov
 iyOHVpDhD0nfhXcTeBab0weDS5IHSuk7RLB4L7OURtwHBdtwcTbdeeyEut+v+P+7DUZi
 RjQzP+h4D8mjrzo2zm53QmLOysYETBHoX7HkaVAKwd0AuE+e+dKzEPklCdg+hISQ4Uj4
 p30A==
X-Gm-Message-State: ACgBeo2359VFSvlgAG9vwSlGlZ2SgQFbqjUdaefzW2ZyAuDhPvWpnXju
 feVjWm6BGK9AJY1BS1b6gww=
X-Google-Smtp-Source: AA6agR4lPLhPOgd0kvQdrsYG0lfbHAw6RTyZuly4XMp3nJOfTywsnqRg8kfDUQXPcALOkjKrdbjbag==
X-Received: by 2002:a05:6a00:2484:b0:52e:34c1:7459 with SMTP id
 c4-20020a056a00248400b0052e34c17459mr1898976pfv.65.1659528489847; 
 Wed, 03 Aug 2022 05:08:09 -0700 (PDT)
Received: from localhost ([223.104.103.89]) by smtp.gmail.com with ESMTPSA id
 d15-20020a634f0f000000b00415d873b7a2sm10724311pgb.11.2022.08.03.05.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 05:08:09 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: guwen@linux.alibaba.com
Subject: [PATCH v3] net/smc: fix refcount bug in sk_psock_get (2)
Date: Wed,  3 Aug 2022 20:07:12 +0800
Message-Id: <20220803120711.172364-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ecf07c1b-a6f3-2537-aacd-a768c437fa7f@linux.alibaba.com>
References: <ecf07c1b-a6f3-2537-aacd-a768c437fa7f@linux.alibaba.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, yhs@fb.com, ast@kernel.org, edumazet@google.com,
 jakub@cloudflare.com, daniel@iogearbox.net, davem@davemloft.net,
 borisp@nvidia.com, paskripkin@gmail.com, john.fastabend@gmail.com,
 andrii@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kgraul@linux.ibm.com, bpf@vger.kernel.org,
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

On Wed, 3 Aug 2022 at 19:27, Wen Gu <guwen@linux.alibaba.com> wrote:
> Hi Hawkins,
>
> Since the fix v3 doesn't involved smc codes any more, I wonder if it's still
> appropriate to use 'net/smc:' in subject?
>
> Cheers,
> Wen Gu
Thank you for reminding me, I will send the v4 patch with new subject.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
