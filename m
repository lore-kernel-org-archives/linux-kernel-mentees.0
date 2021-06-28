Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7996FC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 16:18:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C7F60230
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 16:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C7F60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2223403D1;
	Mon, 28 Jun 2021 16:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LJ2CCppTPvqF; Mon, 28 Jun 2021 16:18:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C26E440375;
	Mon, 28 Jun 2021 16:18:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F46AC001A;
	Mon, 28 Jun 2021 16:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42216C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23DBC60796
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wX3WMhq1Smvv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:18:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EFB96060F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 16:18:18 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso207171pjx.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=//f/I/KD5xRd11o6Hb+6q4JyvdMxw/dD/4E2XDupayw=;
 b=Z8moeK0GXjeB66FKcPwH3GhxOtubjszNU47sbPsRl37VdUbtv7ezQC/QfRLgOiGrEn
 MrCMkFtK7eyrOt7e+L67uwl1BPzLQTz2Oj+vUFNNJdYIAGbGNZ/EHvc/shVu3PxwA0ZP
 0mgfs2y6ZdP1g89tQMg+Xo2l0E6Wq/MLLv8q5wULSBl+PfPM/xUH8mGcX0xOGSkOXGY2
 3guSSrsNtb/64oybj793dL9H7UDJ3mN98X40KZbaco128EpiSLmqhLIe2VNrPrcEhR8A
 DmwKLP0E6ddAckakbxvwJpHhu1EqgY9DutiasUuga5a0ne2xj6NxT8FbUoGbzbZcva84
 77+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=//f/I/KD5xRd11o6Hb+6q4JyvdMxw/dD/4E2XDupayw=;
 b=WrpSMaYjQqf9Xp7xx8GQuPzAPqVypukPDC6ORwet7vHGcPXWA4Ooo+6vhkpxELkVSr
 RetcNRLaoaCdKZ4Sw7iKgdzK+16PN+HgzpWfG3Q9fcVJW+xRV1IuVreP7o+iDykTXJCV
 0QJqLSgbjOBpYR3qXeMDe+06icZz6mUTAei4ZOcTnM+nSRYSsrTK59vriUtRL9jQxjBn
 SqKyoU21hDWX6tCpHzK6P73l4c+1HiTZKAA1VeP7qXnZ6Ivs4nDjDfTQwEMtLu8x6lbV
 FJGXgIJPoJ3bCeCDcNlAVeQvZTPgE6Pg0+taTBzBKePtEEi91D46jL9TCNHX43y3XeVs
 qkXA==
X-Gm-Message-State: AOAM530dKwkfRLLu4GCq8Y5wqQGPgpHE3v3v4RkLaJ/HWa0ud6jBCMyb
 Xs2+5HoX4RdnR9ACiaFTY9M=
X-Google-Smtp-Source: ABdhPJwFubJeZBk8HM0tH0MnapCVqseK4cwUuK494LXwUm+m9HpCj4dMkcB/VPJF8q7Lj3ManFCS7g==
X-Received: by 2002:a17:90b:3a91:: with SMTP id
 om17mr29493006pjb.50.1624897098072; 
 Mon, 28 Jun 2021 09:18:18 -0700 (PDT)
Received: from [192.168.93.106] (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id l7sm14875506pgb.19.2021.06.28.09.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:18:17 -0700 (PDT)
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Eric Dumazet <edumazet@google.com>
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
Date: Tue, 29 Jun 2021 00:18:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
Content-Language: en-US
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, Neal Cardwell <ncardwell@google.com>,
 kpsingh@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 6/28/2021 10:52 PM, Eric Dumazet wrote:

> Unfortunately this patch might break things.
> 
> We keep changing this CC switching, with eBPF being mixed in the equation.
> 
> I would suggest you find a Fixes: tag first, so that we can continue
> the discussion.
> 
> Thank you.

Thank for your feedback. I will resubmit it with a Fixes tag.

Regard.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
