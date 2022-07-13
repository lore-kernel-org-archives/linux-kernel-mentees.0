Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72863C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 03:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAEE24113E;
	Wed, 13 Jul 2022 03:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAEE24113E
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HYDPHqvT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZx_98uRFD8r; Wed, 13 Jul 2022 03:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F2A904025F;
	Wed, 13 Jul 2022 03:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2A904025F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5DE9C0035;
	Wed, 13 Jul 2022 03:54:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF94C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24E8740D7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E8740D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tg1VuUVBPg9X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:54:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CAD44025F
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CAD44025F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:54:16 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id y141so9167631pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jul 2022 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4PUdB8dVnvZuC81zaWvCmS9tlD9k9mFvoBHlllyMfo=;
 b=HYDPHqvTOcp7dZcdSqeq+Miw5OCWtioscKlj1C4Jf4kS6jx5Debfq0QMb+PRiGz9As
 zWhi/eEWkN2/BVP1/C1Zj14HErOrPmoOi/dH1zR8LZqGKj2bP+0tw4N67Z9irLiDAX+x
 +4yluLGkonk94EsIywRR0KomJKkT6t4/rPCCvb0gY7PD6G7aMnitaf68AbwkBXcUuyR3
 T+O62t00hswopUGCYKUuxI4pzkXvh2XJS9fDyKL3tQ0IfTLc2tD2TZvZtH680h4UY2CF
 Ikh/Ao1cbYfMArTEvfSHvDofrKi58wLQd5CAW39CafCE0J6qbhunuLbjZiVluQnQtoJ3
 b55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4PUdB8dVnvZuC81zaWvCmS9tlD9k9mFvoBHlllyMfo=;
 b=chfyKvJeE17EWbKPN2s2uKG1Ou7ou8mLu5tHJxgT9+bHHnUDDzq2eWhslrpnlK1Sfx
 nDNT/Tdpr1FqfDDvOff6VA3ZtI8JyIvDnDGuRFefTtoweGpmeYsFtk25qdGhAOuww13h
 gXuhJWafsfF87u3HhsHcxyZR/Fm2WK+zdqkEW3ZK3OGRUp4V5sEJHqkpDitWVfqBufoZ
 4QVOnptSDi7bNGxoh2E3Ri0VV3WrYZrNS878Ihr1t1oBLxEDwm/yXW37pV8P96zaLOKZ
 NxQfPjBkAMlqZ+Y2SNVkCUmLbgRyA9Lr+gmiWECCIEh4ucHXanPrKkqtHWrQUWRRTbZv
 KhFQ==
X-Gm-Message-State: AJIora+yikHIFrMUlYlaFlbddHfRv3muWGF2c++g8mpWPHK4/w9kosnF
 Rg9UOzCt4Wzo+OdMi8SsSM0=
X-Google-Smtp-Source: AGRyM1ufVlFqpStvjGQBNKeGmgZU/emowlMyxX8RxVbkptqYnuEBDwNfCNh2iTGOnV+fC7jRnFfYpA==
X-Received: by 2002:a63:1824:0:b0:408:a22b:df0c with SMTP id
 y36-20020a631824000000b00408a22bdf0cmr1333293pgl.119.1657684455954; 
 Tue, 12 Jul 2022 20:54:15 -0700 (PDT)
Received: from localhost.localdomain (42-2-207-060.static.netvigator.com.
 [42.2.207.60]) by smtp.gmail.com with ESMTPSA id
 s19-20020a656453000000b00411acdb1625sm6855844pgv.92.2022.07.12.20.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 20:54:15 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: kuba@kernel.org
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Date: Wed, 13 Jul 2022 11:53:44 +0800
Message-Id: <20220713035344.60733-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712203311.05541472@kernel.org>
References: <20220712203311.05541472@kernel.org>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com, yin31149@gmail.com,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 kgraul@linux.ibm.com, chuck.lever@oracle.com, guwen@linux.alibaba.com,
 bpf@vger.kernel.org, kafai@fb.com
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

On Wed, 13 Jul 2022 at 11:33, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 13 Jul 2022 11:10:05 +0800 Hawkins Jiawei wrote:
> > In Patchwork website, this patch fails the checks on
> > netdev/cc_maintainers. If this patch fails for some other reasons,
> > I will still fix this bug from SK_USER_DATA_PTRMASK,
> > as a temporary solution.
>
> That check just runs scripts/get_maintainer.pl so make sure you CC
> folks pointed out by that script and you should be fine.

Thanks for your reply, yet I am not the patch's author, I
found this patch during my bug analysis.

I will reply the relative email to remind the patch's author.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
