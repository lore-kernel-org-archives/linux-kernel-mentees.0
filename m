Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85DFC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 09:11:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42740223AB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 09:11:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+DwG3DC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42740223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF8278675F;
	Mon, 26 Oct 2020 09:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ciP8dSbOxl4U; Mon, 26 Oct 2020 09:11:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E39FA86763;
	Mon, 26 Oct 2020 09:11:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6780C088B;
	Mon, 26 Oct 2020 09:11:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D171C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3CBF4871E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3P68qK+oeN5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:11:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 53AF78717A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:11:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t22so4442316plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=YpWE8DLQH/6C0EaamImAFGVVe02qVTR6iNF0TG/1LMQ=;
 b=J+DwG3DC4DrDUr2ofw1jzxvnuLRuolKN4uBLHJJ4ZI1bJYznPERPOOFfGrJ05CKzMa
 FAhkZdPrGIM/kGB46RIwEUMbOCWzPPtpkXPQeBcMDLdGQpuF0R97obdFSvscfgX8Hk+H
 o8Z/2wsggY7qFZEnMT6LZC+gsaIWw3VQCcmHvoCFwqw9Jamop85gBA4FrETjP9cn7+fw
 D849Nb+szVkdTufU2NeNmsRwfFp9QVmWhPAF3dXMS4zBpj4Aou/Mhi8TBq9beXnFDZty
 WKy/q0wIjXWFUOH5r9UW3tCH1bGR/D2+V0kZu4TdIJ4H6il+HyxFrb8pW4c5R3GvhBqK
 45uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=YpWE8DLQH/6C0EaamImAFGVVe02qVTR6iNF0TG/1LMQ=;
 b=OJkZnBGLClVTnoCZVPAEvnq86qvDUFbNDnzE+QkfiaBnYZ6TuoVoqEukZiOXr4nJcv
 a8pbUp11xSXuZyAoJwAe+D2U9SKbEQ5DNKNxlrZl0SoxUOQNaWTduc6Dag6EsABJpzfR
 i5ZWM3l2Bc31VmWCOJvyv7NBTI+ziWPo206BgLj65BcrkLQp7paMYSXZfvEHlTEDv2k4
 36ffV4S6o6eAO2mkFPWmKlkYP7Wm54X9HU9giMHDnbpSKfSsvqfCtcSeriC0ucPDmceI
 r6Xna/UDXTM9vn/IoSDDSaCscBMkAUO0L0JZFEI0UKZe6vzyi9+quyfVULPcB3DxPTzP
 RBbA==
X-Gm-Message-State: AOAM533tRA357FFTHzz7E95pWjvpb4fGMadpg0n6jXOYkmq13b5+ZwCA
 sS7DiASlprgSCJk6JR8GbWp8X3mJeND8hQ==
X-Google-Smtp-Source: ABdhPJwLjpaH/x5ZeLPPPbsiIikyQ6mi1g6C4IrvIVpLGGf4S0ZuFNksAMm1PYtVNsfOj+bu9SZXvw==
X-Received: by 2002:a17:902:6b88:b029:d3:e6c5:fa3c with SMTP id
 p8-20020a1709026b88b02900d3e6c5fa3cmr11288656plk.80.1603703487470; 
 Mon, 26 Oct 2020 02:11:27 -0700 (PDT)
Received: from ?IPv6:2402:3a80:42a:eeb9:e515:1a3:f154:e7ea?
 ([2402:3a80:42a:eeb9:e515:1a3:f154:e7ea])
 by smtp.gmail.com with ESMTPSA id 186sm10940206pff.95.2020.10.26.02.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 02:11:27 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <f5a91092-8bb2-5cae-6911-3f1d4150d627@gmail.com>
Date: Mon, 26 Oct 2020 14:41:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Mentee Proposal Feedback
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

Hi Sir
I have made a proposal based on your suggestion for interactive
checkpatch.pl. Do I need to add more than one task in it? Actually, it
was exceeding the 1.5 page limit as you mentioned so I decided to ask
and get a feedback on this.

Link of proposal:
https://docs.google.com/document/d/1GpyLzJwDkH06azgThZMnaFKvn8bwo6UI10em8weWjcE/edit?usp=sharing

Thank You
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
