Return-Path: <SRS0=QUeb=I2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9FEC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 Mar 2021 18:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A9B6197E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 28 Mar 2021 18:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A9B6197E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F8A8392C;
	Sun, 28 Mar 2021 18:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-V38rzgOyHx; Sun, 28 Mar 2021 18:45:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4E283926;
	Sun, 28 Mar 2021 18:45:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06549C000B;
	Sun, 28 Mar 2021 18:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47977C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 18:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27CDD4026F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 18:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANy-IXQxMap6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 18:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD1DE400BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 18:45:36 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b83so15079749lfd.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Mar 2021 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i9QQ/MF1ty4petQ8Mzj557Qsdpc6PlWXTrpnIGrdc1I=;
 b=NhDB0IlKoU2Ml/a3sPvGp0Crpjjt4RD9fT0DwDDIJKKOepL2o5xMWdUpfhNZ4Aq+SS
 K7O9hNMGydC+rV9vzUWi+axUDaAk1ZrgJDS+0y4L3W4XClEo+MONdjHATrtATDM/Zd9h
 0xYYlT+FeERDFVCz+0MNJs/61116YwEesWgJxy2xcQKP1xMxpnwgoFABGU1Dayv8z2S9
 mig5YXw8vTj5kQHzIfufWUWuXpd1AbZdqyg/+qNr7VhD8AOHDVkyqVotn/G1h/Iz1l47
 5DGq7njoI2tQpA1svaDArh5sGNsIkeZdQgRWG2TJXy5WoXqFnPzErBXxt79Yw9CBAziG
 yAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i9QQ/MF1ty4petQ8Mzj557Qsdpc6PlWXTrpnIGrdc1I=;
 b=ej5ZXb6Wh9T//a44aokCFvn+GIzsh4Hs65sRRVChOf/lejmbMr7Vf/7yKaN+BAaUkW
 SPpPUUkjP64YmRZnPSs72s9+8Pw3MUxDp5JNDp+64gG/mDL9a+sLXNOhueY/aYdVfjwt
 M7XVOyB4N1K7TLtsyN1WnCRsp1pFEBy16vv1HoELpA2o4Ifh+k35ai8dGzK9DIVP3T75
 dWNsMmgnpeT1U11J1ShgAkQJVj1eu+t2V01fM9mLec3lh4Jn3aDliQUPylwomes66Z87
 yakUonDxssno/4kESiimii1MBMRRq786ueGBah2wLpfI0xg9jURG9dxu+TjayrC7550e
 w2WQ==
X-Gm-Message-State: AOAM531dGqoh3LlNB1qZU4LxswPMEt8SEbHCsptitz2QUEHJKFYfeTUe
 o3ViHkR2gLNeFaf7jSvDio5WQw4z611Rz+1zEYA=
X-Google-Smtp-Source: ABdhPJwJKTWAyIuYhPL+xFHJMLhxdvP7TB/oMboiFVneYtgMXKcAJH+0IEE+Xk2Bc6I0f7ozJxROKatMYfKDfZINmyQ=
X-Received: by 2002:a19:ee0d:: with SMTP id g13mr14677327lfb.38.1616957134452; 
 Sun, 28 Mar 2021 11:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210328120515.113895-1-atulgopinathan@gmail.com>
In-Reply-To: <20210328120515.113895-1-atulgopinathan@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 28 Mar 2021 11:45:23 -0700
Message-ID: <CAADnVQ+PyPtcNagDDFE8cOOZCg9cAv_xJerBSY9BPziKEpai0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: tcp: Remove comma which is causing build
 error
To: Atul Gopinathan <atulgopinathan@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Network Development <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 syzbot+0b74d8ec3bf0cc4e4209@syzkaller.appspotmail.com,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
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

On Sun, Mar 28, 2021 at 5:05 AM Atul Gopinathan
<atulgopinathan@gmail.com> wrote:
>
> Currently, building the bpf-next source with the CONFIG_BPF_SYSCALL
> enabled is causing a compilation error:
>
> "net/ipv4/bpf_tcp_ca.c:209:28: error: expected identifier or '(' before
> ',' token"
>
> Fix this by removing an unnecessary comma.
>
> Reported-by: syzbot+0b74d8ec3bf0cc4e4209@syzkaller.appspotmail.com
> Fixes: e78aea8b2170 ("bpf: tcp: Put some tcp cong functions in allowlist for bpf-tcp-cc")
> Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>

Thanks for the quick fix. Applied.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
