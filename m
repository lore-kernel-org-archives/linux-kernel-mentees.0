Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8F8C4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Nov 2023 14:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8799B41F52;
	Thu,  2 Nov 2023 14:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8799B41F52
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SVxmB8wP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGp2as0-lPOZ; Thu,  2 Nov 2023 14:58:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 84A8B4214B;
	Thu,  2 Nov 2023 14:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A8B4214B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D62EC0039;
	Thu,  2 Nov 2023 14:58:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CEFDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 14:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A2EF4F105
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 14:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2EF4F105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLMXE54USMtC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 14:58:57 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1098041F52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Nov 2023 14:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1098041F52
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5a9bc2ec556so766315a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Nov 2023 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698937136; x=1699541936;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4u7No3WKyf2rx02w8WP9k4VSXCaz8LOG7ZTnqR2+ek=;
 b=SVxmB8wPQ2qqS/PvTyAoDs/i8AC+GA23iM/t/rjPvPfKMnZkS6+sCIH7H1/17aVi1L
 EcTTtbkJ0tVFCiRDPnfx8WLv5Lm8T8xRT1+JyHmQpXiJ2jAXFY3MUn3gRdWLT5pHpUWX
 qdCywWMdLJjzEcxelGlqLAoKRlWg4c0cgPHxy0NskOcua+KOAPmI/KlRbgmvHDHjDCHn
 Lh2ygNxBemjVgUCK/FdmcOycXtx/B9BLnIyh/g1/WZYhhTsGODyH54IFlI2NroiA9h0O
 kXKWVL26qJhVnto/m/PsbDxBE6GD0h4RDAnBeS9TG1wE+XxVRXG/RwSeENn7JlBA0afe
 g+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698937136; x=1699541936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4u7No3WKyf2rx02w8WP9k4VSXCaz8LOG7ZTnqR2+ek=;
 b=MRBVMY+xmqU04HKhYMoBMScUm414gfBfedr+FkuToYZoV9Jm2K7s8EgedYzQLOREEW
 Hx3ZUjsD/muwdZyRp9u+8Ova+LhmXjclySr9Dc0OAuRDdjUeXYZJlYur9XhqFeHXtKlh
 lUyDLHCksewI0paSXl0JeFAftoLTuIMC6C55BaSmQVhXiM7zib0f5gvi/hx2zJxh4EOY
 MOS8t0y8CVuMQtiFZys7StzzKSv+/oh+CACVwuwD8s0Y+mQIQZ2pJWAD44xO3jYUegGW
 NpKhWYMkSdsxuL4NDqSdUtt6TU/S1MrdtrexMvZ14JdTp+M6QG6lEu9IErRjuHOP9PpD
 4XPA==
X-Gm-Message-State: AOJu0Yxj7EZjxhnhO13gXROWblaHuCCOazT55lZsG43t86mPbhJ3AsvH
 mDzdLwjQwkKchzTGwvGX8sCKBnmKMEK5XrfaQLg=
X-Google-Smtp-Source: AGHT+IHdvPSy+RpNAcSrHdhaIDNs4asX/ZQ6VV/5u4vPmHrxV/dewik6XQ8cKyVnVlKlZ3jtll2O6CpvbNNzou36uSs=
X-Received: by 2002:a17:90a:ec03:b0:280:664d:cd9e with SMTP id
 l3-20020a17090aec0300b00280664dcd9emr10351944pjy.19.1698937136368; Thu, 02
 Nov 2023 07:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
 <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
 <VI1P193MB075221DDE87BE09A4E7CBB1A99A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+bxMKEVUhu-RDvOMcbah=iYCWdXFZDU0JN3D7OP26Q_Dw@mail.gmail.com>
 <VI1P193MB0752753CB059C9A4420C875799A1A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CACT4Y+ZS5cz9wZgxLVo2EsGtt-tkFXkFPA6CGAA8Gy7+sEyDUQ@mail.gmail.com>
In-Reply-To: <CACT4Y+ZS5cz9wZgxLVo2EsGtt-tkFXkFPA6CGAA8Gy7+sEyDUQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 2 Nov 2023 15:58:45 +0100
Message-ID: <CA+fCnZdRWs=P4EgzC9sSDLfO=Bxbs9FyeOcqAiY8pzvMLUX=Aw@mail.gmail.com>
Subject: Re: [RFC] mm/kasan: Add Allocation, Free,
 Error timestamps to KASAN report
To: Dmitry Vyukov <dvyukov@google.com>, Juntong Deng <juntong.deng@outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

T24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMTA6NDbigK9BTSBEbWl0cnkgVnl1a292IDxkdnl1a292
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gPiA+Pj4gVGhlcmUgaXMgYWxzbyBhbiBhc3BlY3Qgb2Yg
bWVtb3J5IGNvbnN1bXB0aW9uLiBLQVNBTiBoZWFkZXJzIGluY3JlYXNlCj4gPiA+Pj4gdGhlIHNp
emUgb2YgZXZlcnkgaGVhcCBvYmplY3QuIFNvIHdlIHRyaWVkIHRvIGtlZXAgdGhlbSBhcyBjb21w
YWN0IGFzCj4gPiA+Pj4gcG9zc2libGUuIEF0IHNvbWUgcG9pbnQgQ1BVIG51bWJlcnMgYW5kIHRp
bWVzdGFtcHMgKElJUkMpIHdlcmUgYWxyZWFkeQo+ID4gPj4+IHBhcnQgb2YgdGhlIGhlYWRlciwg
YnV0IHdlIHJlbW92ZWQgdGhlbSB0byBzaHJpbmsgdGhlIGhlYWRlciB0byAxNgo+ID4gPj4+IGJ5
dGVzLgoKPiA+IERvIHlvdSB0aGluayBpdCBpcyB3b3J0aCB1c2luZyB0aGUgZXh0cmEgYnl0ZXMg
dG8gcmVjb3JkIG1vcmUKPiA+IGluZm9ybWF0aW9uPyBJZiB0aGlzIGlzIGEgdXNlci1jb25maWd1
cmFibGUgZmVhdHVyZS4KPgo+IElmIGl0J3MgdXNlci1jb25maWd1cmFibGUsIHRoZW4gaXQgaXMg
T0suCgpGV0lXLCBHZW5lcmljIEtBU0FOIGFscmVhZHkgc3RvcmVzIHRoZSBhdXhpbGlhcnkgc3Rh
Y2sgaGFuZGxlcyBpbiB0aGUKcmVkem9uZSwgc28gdGhlIHNpemUgb2YgdGhlIHJlZHpvbmUgaGVh
ZGVyIGlzIDI0IGJ5dGVzLiBQZXJoYXBzLCB3ZQpzaG91bGQgaGlkZSB0aGVtIHVuZGVyIGEgY29u
ZmlnIGFzIHdlbGwuCgpIb3dldmVyLCB0aGUgaW5jcmVhc2Ugb2YgdGhlIHJlZHpvbmUgaGVhZGVy
IHNpemUgd2lsbCBvbmx5IGFmZmVjdApzbWFsbCBrbWFsbG9jIGFsbG9jYXRpb25zICg8PSAxNiBi
eXRlcywgYXMga21hbGxvYyBhbGxvY2F0aW9ucyBhcmUKYWxpZ25lZCB0byB0aGUgc2l6ZSBvZiB0
aGUgb2JqZWN0IGFuZCB0aGUgcmVkem9uZSBpcyB0aHVzIGFzIGJpZyBhcwp0aGUgb2JqZWN0IGFu
eXdheSkgYW5kIHNtYWxsIG5vbi1rbWFsbG9jIHNsYWIgYWxsb2NhdGlvbnMgKDw9IDY0CmJ5dGVz
LCBmb3Igd2hpY2ggb3B0aW1hbF9yZWR6b25lIHJldHVybnMgMTYpLiBTbyBJIGRvbid0IHRoaW5r
IGFkZGluZwpuZXcgZmllbGRzIHRvIHRoZSByZWR6b25lIHdpbGwgaW5jcmVhc2UgdGhlIG1lbW9y
eSB1c2FnZSBieSBtdWNoLiBCdXQKdGhpcyBuZWVkcyB0byBiZSB0ZXN0ZWQgdG8gbWFrZSBzdXJl
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
