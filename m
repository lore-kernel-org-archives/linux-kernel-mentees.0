Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F16C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 22:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 593EC4149A;
	Tue, 15 Aug 2023 22:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593EC4149A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=H7tXeonS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzJPZ5ALDBMq; Tue, 15 Aug 2023 22:27:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF6841499;
	Tue, 15 Aug 2023 22:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF6841499
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4948EC0072;
	Tue, 15 Aug 2023 22:27:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D36A2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE2F4149B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABE2F4149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOhDqUglB95R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:27:55 +0000 (UTC)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D311341497
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 22:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D311341497
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-58c5642701fso13024687b3.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1692138473; x=1692743273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kY8kU69GDJUJ7+R5pknqqvh2AZUBumVN8OS68K0+MY=;
 b=H7tXeonSCquKg5AN0QNsHMQVIBdXDcs1LV0ZUmVB53pLGrJdXGf9EVp1Rqrh7eYr3r
 D1+Xaa9DWahcxAYd/BfvH8gpW1EDGtuFb8rEIYX6rH4F+2OB0YA7fwlRuedLUhtuFG9f
 yhPEMGb+t3OkEAcRmsmB4oWuwBYGgUJE2WGhx2+Dww5M5ur0A/k2uSgE6wFIDMs9KwcL
 7KgwxczOlpCWWb1xuKrLXgncEPrjR5oH8mzxfIYCjrapBFEAYx/WOlnLDAxoSWH8C7Ub
 AMapce/two7o039ktZEDZGGYq3W5k0gIPiIrZMfGYWQ9LmMxVWgIaN4rLiweyKqSILNo
 Ukwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692138473; x=1692743273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9kY8kU69GDJUJ7+R5pknqqvh2AZUBumVN8OS68K0+MY=;
 b=dSCf7RryDgAgtEjMKEbtPyfA+AdizHgYXtSFg+WbHVEGv229gX6qsMrdHXFYzEWe6O
 swgaO3eyB9jwZUkGHZAGYa/Pz6H2aiZ/myfMtjRueYodLt+/mY0uz3D/o1a8dl0g0nPW
 Urc5eev7xv94acq3xAgRuEATKgIohf5ggsgw9QLzFN855bgTFJAvtNmkRlXysxFPeg0k
 0hrgds1C5bqLtceLmFSYK1GDpohOjEQTKXitonLe5y0FJ4ZTbV/E1k9DnZnEwyVIYwEU
 GtDvf9CxB+TO/sYVjnjVamt5KmrYW3rC86lZvWj81npdKixHISPmZ/RtgvKuMMiLzA8K
 hxyQ==
X-Gm-Message-State: AOJu0YxH/kEg4Z9BREKUAzgIcXHbCro6YecNtOjE8804iKbAOqMQs7Gq
 EQlFZnIRNHnaEBK0rYIT+fEv8bOlVKGXuMQXXYDG
X-Google-Smtp-Source: AGHT+IGDT9WCmFX3f04gJ9axQtaQzS0X8fIxSAPsF8jgsCRv6mq072IFO2z58cS3DS66MoOtzwvyZTBcIasZhjt+6s0=
X-Received: by 2002:a0d:eac9:0:b0:583:4e2e:9da0 with SMTP id
 t192-20020a0deac9000000b005834e2e9da0mr16525221ywe.1.1692138473661; Tue, 15
 Aug 2023 15:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230815205917.1504837-1-andrew.kanner@gmail.com>
In-Reply-To: <20230815205917.1504837-1-andrew.kanner@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 15 Aug 2023 18:27:43 -0400
Message-ID: <CAHC9VhRRcMQhbobpGZy0ha3saOJ4Ke1CCnExKSJq1E2jXCU3NQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] netlabel: KMSAN warning
To: Andrew Kanner <andrew.kanner@gmail.com>
Cc: selinux@vger.kernel.org, eparis@parisplace.org,
 stephen.smalley.work@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

T24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgNDo1OeKAr1BNIEFuZHJldyBLYW5uZXIgPGFuZHJldy5r
YW5uZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IFJlY2VudGx5IEkgc3RhcnRlZCB0byB1c2UgS01T
QU4gYW5kIGZvdW5kIHRoZSB3YXJuaW5nIGluCj4gc2VjdXJpdHkvc2VsaW51eC9ob29rcy5jIHdo
aWNoIHRyaWdnZXJzIGVhY2ggdGltZSBJIHVzZSB0aGUgb2ZmaWNpYWwKPiBndWlkZSB0byBydW4g
c3l6a2FsbGVyIHJlcHJvZHVjZXJzCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xl
L3N5emthbGxlci9ibG9iL21hc3Rlci9kb2NzL3N5emJvdF9hc3NldHMubWQjcnVuLWEtYy1yZXBy
b2R1Y2VyCj4KPiBJJ20gbm90IHF1aWV0IGNvbmZpZGVudCB3aGF0IGFyZSB0aGUgcnVsZXMgaW4g
c2VjdXJpdHkgc3Vic3lzdGVtLiBJdCdzCj4gbm90IGEgYnVnLCBidXQgYSB3YXJuaW5nIHdoaWNo
IGlzIHRyaWdnZXJlZCBieSBLTVNBTiBmb3IgdGhlIGFyZ3VtZW50Cj4gb2YgdGhlIHNlY3VyaXR5
X25ldF9wZWVyc2lkX3Jlc29sdmUoKSB3aGljaCB3YXMgbm90IGluaXRpYWxpemVkLiBJdAo+IHdp
bGwgbm90IGFmZmVjdCBhbnl0aGluZyBpbnNpZGUgdGhpcyBmdW5jdGlvbiwgYXQgbGVhc3Qgd2l0
aCB0aGUKPiBjdXJyZW50IG9yZGVyIG9mIGNoZWNraW5nIHRoZSB2YXJpYWJsZXMsIHdoaWNoIG1p
Z2h0IGV2ZW50dWFsbHkKPiBjaGFuZ2UuCj4KPiBQbGVhc2UgcmVwbHkgaWYgeW91J3JlIG9rIHdp
dGggc3VjaCBub3QtYS1idWcgZml4ZXMuIE90aGVyd2lzZSBJJ2xsCj4ganVzdCBpZ25vcmUgdGhp
cyB3YXJuaW5nIGluIG15IGV4cGVyaW1lbnRzIHdpdGggS01TQU4uCgpJIHRoaW5rIHRoZSBhbnN3
ZXIgaXMgZ29pbmcgdG8gZGVwZW5kIG9uIHRoZSBwYXJ0aWN1bGFyICJidWciIGFuZCB0aGUKcGF0
Y2ggcmVxdWlyZWQgdG8gcmVzb2x2ZSBpdC4gIEluIHRoaXMgcGFydGljdWxhciBjYXNlIEkgdGhp
bmsgdGhlCnBhdGNoIGlzIG9rYXkgc28gSSB3ZW50IGFoZWFkIGFuZCBtZXJnZWQgaXQsIGFsdGhv
dWdoIEkgZGlkIHJlbW92ZSB0aGUKIkZpeGVzIiB0YWcgYXMgdGhlIGN1cnJlbnQgY29kZSBpc24n
dCBicm9rZW4uCgpJbiBnZW5lcmFsLCBpZiBhIHRlc3QgdG9vbCBkdW1wcyBhbiBlcnJvciBvciB3
YXJuaW5nIGZvciBzb21ldGhpbmcKdW5kZXIgc2VjdXJpdHkvIGFuZCB5b3UgYXJlbid0IHN1cmUg
aWYgaXQncyB2YWxpZCBvciBpZiB3ZSBuZWVkIHRvCnJlc29sdmUgaXQgdXBzdHJlYW0sIHlvdSBj
YW4gYWx3YXlzIHNlbmQgdXMgYW4gZW1haWwgYW5kIGFzayB3aGF0IHRvCmRvIDopCgotLSAKcGF1
bC1tb29yZS5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVz
QGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
