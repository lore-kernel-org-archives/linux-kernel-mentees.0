Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F31EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Jul 2023 15:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2F99400FF;
	Sun, 16 Jul 2023 15:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F99400FF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ctFvETFr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGQpqrypjOie; Sun, 16 Jul 2023 15:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D240D400FB;
	Sun, 16 Jul 2023 15:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D240D400FB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AECC7C0071;
	Sun, 16 Jul 2023 15:53:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26A42C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1A11802CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A11802CF
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ctFvETFr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LJk2tm9d99S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56B9C80B9B
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56B9C80B9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:53:34 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-55b1238cab4so2088115a12.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689522814; x=1692114814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abs11f8UHVu+fecLFEFwp0PW6/N5LPbHdu0gV+3y038=;
 b=ctFvETFr7bnJxUyExlXVogWAbDtwrZb9lVS8wjLMPmQtSNPHo3RiCI3D7RdOxnIdrg
 KbpcR1/UGhV4a5YawvKmm5xtctdaHE1Y2dXbL26fFQTaSX0YKeOV/OdxIyJKbt1uS4ux
 hJ+ypmbBTYuU/0+8zlCOkLGZN66xLUmjqjAzH+ld2Hhc9blh4Fq49cy4IOIvpkuA8rk8
 /T2QY0isHdD4iT54ky3nzir6HJuvASdSxwNzDb72h452fN816pfKhntGQz8sr5XV+/mt
 rAP4H23HyPcXpC+ErWLpMO/vyJHPu+an9200hVB3cUpgW4fAlnPVVUgrdnVB3YhPXzqZ
 Z30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689522814; x=1692114814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abs11f8UHVu+fecLFEFwp0PW6/N5LPbHdu0gV+3y038=;
 b=IpgjpY62wgMyzXHx3aBRl6AFrpQwakl82ZN29kH34eV4M5M1VXIF2A4ixaYaGMVfmD
 HITC1eTr2Ev/M7dLdvpTCpcyaRxjWBbzWY25tRLEC41MRuqOD8Q3tQjYDoO61hCoXo0c
 +royjB0fj6M9yjh2ds/UrF9V2EpABpwTWcD4/jKOewwQ/QsLOgos3eELJazvwZcVvRmh
 MGIMY54Sha1ZWZg6wnrZE/EAUhLkKyLyliHmraIF1Un2ORMWjUCilP9BEstGSSySqGb7
 x0VVQnSq+9Xo3NDmHtcR2RsB9TasmOyjb+Yk1Dbwnh0tJBLHuC2rTkJ+79yZ7V0vX+UK
 XhpA==
X-Gm-Message-State: ABy/qLYqohabcTsMpK/zWv9OnyRxZJ2MvPQCjLuTjGlLdW2TirVQbZGL
 QNZ3avKTiLiRkIL/7SnSyuc/KqlJvOb1xpYExeI=
X-Google-Smtp-Source: APBJJlEGQtfsRwz1XtspqBQl34vmpvD+Dei7LRAoFDGxKuzO815i+XyeZQE6FVEUNXOjwbyrPM/p7K+ru97TpSRLgWA=
X-Received: by 2002:a17:90a:eb12:b0:24e:2e86:5465 with SMTP id
 j18-20020a17090aeb1200b0024e2e865465mr8674012pjz.31.1689522813638; Sun, 16
 Jul 2023 08:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <ZLO450xOIQ29VoBT@zephyrusG14>
In-Reply-To: <ZLO450xOIQ29VoBT@zephyrusG14>
From: Vincent Legoll <vincent.legoll@gmail.com>
Date: Sun, 16 Jul 2023 15:53:22 +0000
Message-ID: <CAEwRq=rUXpFpkrfKyCG8Eede10cCeo6V3RCDxv0McWA_g9t0CA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4
 boards
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

SGVsbG8sCgpPbiBTdW4sIEp1bCAxNiwgMjAyMyBhdCA5OjMy4oCvQU0gWW9nZXNoIEhlZ2RlIDx5
b2dpLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+IENvbW1pdCBmNDcxYjFiMmRiMDggKCJhcm02
NDogZHRzOiByb2NrY2hpcDogRml4IEJsdWV0b290aAo+IG9uIFJPQ0sgUGkgNCBib2FyZHMiKSBp
bnRyb2R1Y2VkIGEgcHJvYmxlbSB3aXRoIHRoZSBjbG9jayBjb25maWd1cmF0aW9uLgoKTWF5YmUg
eW91IHNob3VsZCBhZGQgYSAiRml4ZXM6IiB0YWcuCkxvb2sgYXQ6CkRvY3VtZW50YXRpb24vcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0CmZvciBkZXRhaWxzLgoKQ2hlZXJzCgotLSAKVmlu
Y2VudCBMZWdvbGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVz
QGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
