Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F91AC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 07:35:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D8F20786
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 07:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D8F20786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B87D28788B;
	Tue, 28 Jul 2020 07:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpuaSN4rV2KE; Tue, 28 Jul 2020 07:35:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DEAB87779;
	Tue, 28 Jul 2020 07:35:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48859C004F;
	Tue, 28 Jul 2020 07:35:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99B46C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 07:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 820C2868FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 07:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hfHUkGpU7nO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 07:35:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B8C4868CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 07:35:15 +0000 (UTC)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MkpnF-1ke6CV1ifP-00mIuL for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Jul 2020 09:35:12
 +0200
Received: by mail-qt1-f173.google.com with SMTP id s16so14200244qtn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 00:35:12 -0700 (PDT)
X-Gm-Message-State: AOAM531JRMtfxN5GHjcLXPBJggVJ83X1bSt/IVAn0WcOEZetjHTV2rpp
 vqob+EbxrAUsT4w5ppFYiOrrysG13SjEMRVjjSI=
X-Google-Smtp-Source: ABdhPJzm02izO1Ffq0PZdADjKoK3t4vds3+X8L/oZzjLjgpqyxpOvLwSSCIHYnBRr4PgGF+B+aNhgZlxi8N9vDUMUn8=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr18758364qtq.7.1595921711141; 
 Tue, 28 Jul 2020 00:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200728022859.381819-1-yepeilin.cs@gmail.com>
 <20200728053604.404631-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200728053604.404631-1-yepeilin.cs@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 09:34:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_61F2OT3FkNF4zTdmQ+VtdGkr+dWu1SuL+q6YbN-Ytw@mail.gmail.com>
Message-ID: <CAK8P3a2_61F2OT3FkNF4zTdmQ+VtdGkr+dWu1SuL+q6YbN-Ytw@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:b7FnoQQDT+nW/rbOzQRD8Y0+UxP/OywIcNMJlXDZLLXSpybZDEr
 wESZ0btPH/0FfOWLZpEkGxfJ+MWWpHISgy26Olnk6sHU24oCGK36A7+vhr/uGn70hneETbK
 b5rROcEVvHos9dV6VErzi+J4YGAxuDXmLaRrvgqBLzHwfjVHokZMpvUhmzakICrsKjPfOVY
 FA1QRXtc5hR6rKc4wZhfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hflypPJDQsc=:r9amO8xvI66UJJRFGgafxn
 xM3lBf8lc+KAb7KHqzhAEBGL7d1BSv8uHHIXvU3+u2QH7PYjBaEyNQgCkkuPuLdW2EW+WX3cZ
 eUC16ucPz0rCLE39A98UsLE7fyeVSLkMnnD4Ki53TXBYi64E07zyQXeDLrd1BUy6IK9PwxorZ
 51k53fcdGVZbhArwkKawL7TyjtglWKDnB3BPfJVSnSwQnmcL38j71OXRbGXaz6rPPs9MLce7S
 mnX1mVtjaHB3kT1afLg1iZFp0HuxCOGwd1vcIS9yPNSvWU/tr7FhPPRigC0D6FTHjDkdfLmov
 mlNUFTF+1HRuuF5NEvPPwzGhrMaHuCzgB9W1MhTrPoTArlByz8H8tZd+NUMJi3UoUHM1JdYUv
 /ahidAuXgyXhJizeTf5BwAfcQ21TrUzq8SyPQqICoQoAc+FZLSvZtFWhJE2lLtnND5DQY2qPS
 v6Zg8rEc2VHbW0DAwR7oJj5c0myrKMTRGgAuesEQszyXfYJ/cjuo7Ri8gllgIauk2XRpzk4W3
 0bcen9Vkdqx84FE8aktKKiRWiHY5aEqIXPMc2u2RPcmgfB++wQIIsKInV2qFhLUNkvMqQPyjh
 DLa3MlH+X8uuynU7i02qqSFoyXFG0VBZX8Y4kJB7rzje9ItTw+zQ5kYfnAk+t8Q3VfM+0f4Jh
 vQ0pJVEZKoMgLF2WxCZxYNepY2peXetktGPH/w51gQ4e9mTeoMxTEadOo2ULC9U+ivWl3m6As
 NQJFnAqIeYhwYiwk+wLC3jIIKVPLVKy3qAYKEm0RP2MMOnwlGb+SmVg2oix9yLIkX5dMLNZvI
 oWodKmfH0fpKiSseA2LijSnjeupqxOeC8wViJGJ9z0liOO4T+ZEZJE7SP6BbJoUP8UOToW90r
 i6ctyBn1iIVyIl23My0Nzo0F8HLonWFY3fhkhssAOxj5yToHPjbs81UazBD3CZF1Gf8scVEQy
 Q/PfzHE1qzcod0cPNnShNQ6Hfdic0UpkiY7xAlnpLgDgcKDntkZmy
Cc: Song Liu <songliubraving@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>,
 Networking <netdev@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@chromium.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Andrii Nakryiko <andriin@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH net v2] xdp: Prevent
 kernel-infoleak in xsk_getsockopt()
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

On Tue, Jul 28, 2020 at 7:37 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> xsk_getsockopt() is copying uninitialized stack memory to userspace when
> `extra_stats` is `false`. Fix it.
>
> Fixes: 8aa5a33578e9 ("xsk: Add new statistics")
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
