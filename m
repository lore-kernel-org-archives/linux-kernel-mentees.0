Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C863DC001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Jul 2023 12:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0154014E;
	Mon, 17 Jul 2023 12:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B0154014E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YfPGG9my
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmSoroSuYsee; Mon, 17 Jul 2023 12:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2284140123;
	Mon, 17 Jul 2023 12:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2284140123
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD256C0072;
	Mon, 17 Jul 2023 12:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4AFAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 12:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F30D80C26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 12:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F30D80C26
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YfPGG9my
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hgPPuzmW__H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 12:13:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A2E80AD6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02A2E80AD6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 12:13:33 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-666ed230c81so4576332b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 05:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689596013; x=1692188013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t7mGkEFG/BBY8i1FxVeGw7e6gM5cItBSc8cgFSjGd4w=;
 b=YfPGG9my9lEnguT2SNwXZKvSdi8mAM5GSP34OK/6lDn5JVemYBY6UY3iEhQB4+HSwU
 TFWJThPRrBJdSOifFr7KXTit991XI1d4B3i6+2Vl9zcShrZ9U8uMRi2/ONcAsJob1Xob
 WieQJrPcwUK3zgSfNhMMbxwItgXdKOBsf3xiF0NphmBNS9wDDCJvvkvJPANQO9EjgC+v
 6fs+N6RbnLLX2PUdX3gocyQWmBa7vdSuAHON6JuStezrnottWN3UihHJvO/kJOtAmr9w
 PRZIwH14FoH+CpVb1O3e5yl7SyeorI1v55pQ37Y98ey1h0ZTH0pAMBTOyymFgEFLfjEC
 XqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689596013; x=1692188013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7mGkEFG/BBY8i1FxVeGw7e6gM5cItBSc8cgFSjGd4w=;
 b=NbPrzzVk9rvEYJgJyKl+aCsP14wezEntgvUJDbI5eXIdZreIyF+D6C5H38AM15SnjF
 DnvrnPpkmASWxlI22JAO2QRrFZ//Ze363U0qvsdiYg73QKbd1GLzEvUWgNXCxStjJJGC
 jEm4TrKGFDEopy5Fds0ohTTzrdPkqz/tIdlDYYXDzBJ8KU91NVzLYdRNOTN+VNiuZsZ6
 ejaHSVxWmJ/c8oH09nZeOwMH+Nk7kQ0SadQAQouWis6mUy9llBbCho7dCh0thE/0xGXk
 Tzfq2ENeSGnoiJsNnaMN6PWMYsbGUqU3th5KX/hZu+cFnDGCyFlE2QC1LtYZ9Rz8gF9z
 P9kA==
X-Gm-Message-State: ABy/qLax8KmoIQATuJiDU++Pc4GcZK/hVkg/6722/ZxYTBlcIhBvm9WC
 YWgPHIhjDICAa1qfFQjMv18=
X-Google-Smtp-Source: APBJJlGj0lHYpLdbzSreLZstrO6fHiwNc5WkCSTSq3H+UhbbRMa8JtFWuzafHld+wv5ysTDXEkvFTw==
X-Received: by 2002:a05:6a00:1353:b0:682:537f:2cb8 with SMTP id
 k19-20020a056a00135300b00682537f2cb8mr15587596pfu.26.1689596013188; 
 Mon, 17 Jul 2023 05:13:33 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 x17-20020aa79191000000b0067738f65039sm11782892pfa.83.2023.07.17.05.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 05:13:32 -0700 (PDT)
Date: Mon, 17 Jul 2023 17:43:25 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Vincent Legoll <vincent.legoll@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4
 boards
Message-ID: <ZLUwZTy3Opx/gdIf@zephyrusG14>
References: <ZLO450xOIQ29VoBT@zephyrusG14>
 <CAEwRq=rUXpFpkrfKyCG8Eede10cCeo6V3RCDxv0McWA_g9t0CA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEwRq=rUXpFpkrfKyCG8Eede10cCeo6V3RCDxv0McWA_g9t0CA@mail.gmail.com>
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

SGkgVmluY2VudCwKT24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDM6NTM6MjJQTSArMDAwMCwgVmlu
Y2VudCBMZWdvbGwgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gU3VuLCBKdWwgMTYsIDIwMjMgYXQg
OTozMuKAr0FNIFlvZ2VzaCBIZWdkZSA8eW9naS5rZXJuZWxAZ21haWwuY29tPiB3cm90ZToKPiA+
IENvbW1pdCBmNDcxYjFiMmRiMDggKCJhcm02NDogZHRzOiByb2NrY2hpcDogRml4IEJsdWV0b290
aAo+ID4gb24gUk9DSyBQaSA0IGJvYXJkcyIpIGludHJvZHVjZWQgYSBwcm9ibGVtIHdpdGggdGhl
IGNsb2NrIGNvbmZpZ3VyYXRpb24uCj4gCj4gTWF5YmUgeW91IHNob3VsZCBhZGQgYSAiRml4ZXM6
IiB0YWcuCj4gTG9vayBhdDoKPiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRj
aGVzLnJzdAo+IGZvciBkZXRhaWxzLgpUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZp
ZXcgYW5kIHByb3ZpZGUgZmVlZGJhY2sgb24gdGhlIHBhdGNoLiAKSSB3aWxsIHNlbmQgYSB2MiB3
aXRoIHRoZSAiRml4ZXM6IiB0YWcuIAoKVGhhbmtzICYgUmVnYXJkcyAKLS0gWW9nZXNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1t
ZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
