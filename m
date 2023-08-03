Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59BBEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 18:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A5660C19;
	Thu,  3 Aug 2023 18:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A5660C19
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AslnQeH8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCjqWGECZqGw; Thu,  3 Aug 2023 18:06:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 77C5E60B01;
	Thu,  3 Aug 2023 18:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C5E60B01
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51C77C0072;
	Thu,  3 Aug 2023 18:06:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B9A1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 18:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F92160B50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 18:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F92160B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_9uNwipKKUm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 18:06:13 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8BF860BAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 18:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8BF860BAF
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe28f92d8eso2154962e87.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Aug 2023 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691085970; x=1691690770;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rwNzRqjsrLX7WFu9uVGqEYEvQpQsX92GbYXkGO6oQUM=;
 b=AslnQeH8eJzuq/VVUImwQu7TOUfyV14+eujAZVLjLqGh/+0SMz+Lh6qHSjMIUFrkCc
 pZCx1XsYT2n7OamDWbeT3SVdzhLG4LEoC6jbvBi5cb9pzf1aK0iUX6AK/KSy2icXOneH
 PEu3E+PReDyGib4cSZ7OPbzwqLC8Nqpf3GVvxg4XR3Yu+22khOTMRw5lPq9nPIvEqAhu
 fWQ7B2Q6tj/nMbxXVgWWt8Fzh1N3+Drrj9r5fNaaBtsEIfO92aqDVaASfLaL2vzNz2S6
 bQSwhjFiCcJ6LVJCDb7yM3PaZYnUoaznR6mciWfM+P9Vc77+1gsPiFKSLNYSJha2MX/o
 auWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691085970; x=1691690770;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwNzRqjsrLX7WFu9uVGqEYEvQpQsX92GbYXkGO6oQUM=;
 b=hviSJbBMYWMQd65+UcqySVnDZSUSoUN0nBCerLj0kVC4tiuTTs/lnWdOKNzmutKMgq
 hCNNkKqLv8uy7IWVHbK5GHTpoWOeevQzelcBa2iVE+SPgbeUV/LKPBfpgvyK4zOOABjO
 vfir8wgDBLoG4lORQqfhpQhXS7uRi+c1o3yGQ9iwLWXF6TN0nP9yB91w8GCX+nBtJ8FW
 /RXOhjAZ0k/2Jx5X6HsT8IWWpIUfbAJeJApwwkcMh/BZNW4omsryUkMPcnbFrGAB3bgu
 wkn0b0PBJpJTTFRBG21e7siLN/aJe9dczR9Q5yYV88s2sG3shaHwPhiYH0gzJp4op304
 7isg==
X-Gm-Message-State: ABy/qLajFRBR/r9cE6fHKY8SfDCn0p1ivfUqltVce0JsDMa4Xb5dF9S5
 /bzM8w+uKsrAM+04RVo9MAk=
X-Google-Smtp-Source: APBJJlGbCy5C9fzMhHjjvo0tgtF2IkFwdRgCZxb3iJwwrsH/cch2pmhWpr6yZtVvcdlAt7ENP5rkXw==
X-Received: by 2002:a2e:870a:0:b0:2b9:4821:22b6 with SMTP id
 m10-20020a2e870a000000b002b9482122b6mr8678156lji.10.1691085970211; 
 Thu, 03 Aug 2023 11:06:10 -0700 (PDT)
Received: from akanner-r14. ([77.222.27.58]) by smtp.gmail.com with ESMTPSA id
 p3-20020a2ea403000000b002b9db7df0dasm66225ljn.8.2023.08.03.11.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 11:06:09 -0700 (PDT)
Message-ID: <64cbec91.2e0a0220.d8b3d.0706@mx.google.com>
X-Google-Original-Message-ID: <ZMvsjUfeVm+y8lpk@akanner-r14.>
Date: Thu, 3 Aug 2023 21:06:05 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 2/2] net: core: remove unnecessary frame_sz check in
 bpf_xdp_adjust_tail()
References: <20230801220710.464-1-andrew.kanner@gmail.com>
 <20230801220710.464-2-andrew.kanner@gmail.com>
 <CACGkMEtRyEkpRetANvU1L97gLtVVT+vaBV1Hmh2QqZu9c9tvYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACGkMEtRyEkpRetANvU1L97gLtVVT+vaBV1Hmh2QqZu9c9tvYw@mail.gmail.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, dsahern@gmail.com, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, jbrouer@redhat.com, edumazet@google.com,
 brouer@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Thu, Aug 03, 2023 at 11:20:20AM +0800, Jason Wang wrote:
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> 
> Thanks
> 

Thanks, Jason.
I will use this tag in v5, if you don't mind.
PATCH 2/2 will be the same but with more recipients.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
