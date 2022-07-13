Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3D5C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 03:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E34E611DD;
	Wed, 13 Jul 2022 03:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E34E611DD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hwNXzEBp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sARgsaOrGjfy; Wed, 13 Jul 2022 03:33:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C0F73614D8;
	Wed, 13 Jul 2022 03:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F73614D8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99917C0035;
	Wed, 13 Jul 2022 03:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 586ADC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21745614D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21745614D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnLhFxwSSrcL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F7E614D9
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57F7E614D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 03:33:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11716B81CD7;
 Wed, 13 Jul 2022 03:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B9EC3411E;
 Wed, 13 Jul 2022 03:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657683201;
 bh=aOVSuVL7JDIlIwE3oEDnonyPf5DF5MKPPsQEw9pumDs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hwNXzEBpaPV02SVg35WWGJ47c04ATIixHzwcXXnsg7Dp5KgOuUFu1Q4hq8ECtB6ro
 wJXe6I6IwvwZVIE5wQqRLzKvYfPtzsi3Re06TqEfCTaSrrzekY+SoMjwZtnZjV3ICk
 NQhDz/h4VG3XKqiQWY3mYP8cJzGxSFPI2d8e1e1/cI65Bgj1Mdl04GqqRlE9asTGnp
 rF5JKEPhePpO8YYWhmkFEQr2yXRYgLF5OWRtFWLvxftlPkhlOgbCse1fe8Jnj3ZGb3
 r5Nv85J8hVxlDMtTVWsNH3fDNvLYwy3yxDa4LILGre/IoZfYN9IZbvMSJaXHSB384o
 Ow38RaI8xyWJg==
Date: Tue, 12 Jul 2022 20:33:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hawkins Jiawei <yin31149@gmail.com>
Subject: Re: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Message-ID: <20220712203311.05541472@kernel.org>
In-Reply-To: <20220713031005.58220-1-yin31149@gmail.com>
References: <0408b739-3506-608a-4284-1086443a154d@linux.alibaba.com>
 <20220713031005.58220-1-yin31149@gmail.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com,
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

On Wed, 13 Jul 2022 11:10:05 +0800 Hawkins Jiawei wrote:
> In Patchwork website, this patch fails the checks on
> netdev/cc_maintainers. If this patch fails for some other reasons,
> I will still fix this bug from SK_USER_DATA_PTRMASK,
> as a temporary solution.

That check just runs scripts/get_maintainer.pl so make sure you CC
folks pointed out by that script and you should be fine.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
