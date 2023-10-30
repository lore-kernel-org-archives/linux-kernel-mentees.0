Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41B8C0018C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 06:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A1B070A65;
	Mon, 30 Oct 2023 06:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A1B070A65
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jybHV+hY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k22YgTSFFh_Q; Mon, 30 Oct 2023 06:29:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0EA4570A5E;
	Mon, 30 Oct 2023 06:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EA4570A5E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8FF5C0071;
	Mon, 30 Oct 2023 06:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC5ADC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 957F385455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957F385455
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20230601 header.b=jybHV+hY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJckRo7k5qBL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:29:26 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 828D985453
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828D985453
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507a5edc2ebso3627e87.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698647364; x=1699252164;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzVHmjEI+YpEe4gZLECBFUB4/fthvdQpMU6WpBuzUV0=;
 b=jybHV+hYo6npHgHwmCmEQqmVyqWGFhJpZQrHIx2mWY7ICRakau1oe37rM8dQy+WL7w
 NL4nPGb2YXc7VBqoIG17T9kgpKBuZtEdpDwCjzW7g2foScssl27ZX0Uz1AuXNDq1IpKR
 LuD+MruylKx+wGYbLO16cQjoy5j8wlB5M8frgJNUIWk8VZ6MBo+d/Tkm04t2DEttno1i
 5BItrsh3MNA/H8THkVgKwyQzdIymgJQuEGHuMvTROLeG8wx5/G568SXcIjmpigOmpkp5
 U5f4HhmdKduQwDTQIQ4sV2X+jziZxhSODvbA9pQz5PGwgXU3528i7qqN71BxWc4KwvZD
 rwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698647364; x=1699252164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzVHmjEI+YpEe4gZLECBFUB4/fthvdQpMU6WpBuzUV0=;
 b=s8gDABxN/baQOm9up1nDY3BZ4z4R/P4CgcHBbwKXaCLioKJ+7P9ivJQDLgcr6JYWCS
 wqOaGkrGPrYpvyCVtWBj52qdXC7c5nUtZr/RmXEqfHFBM4JvXde9yXP9e+Yxb6JAsoqg
 VgTmxr5uaNPML3JZjo+DAbOhJeVvGrnhtjB7ihtsXX6BRDm6Y3Tx5EKFTeRuFgj/TSnh
 KzWnNntvABfTEpu2bzWW4yQeJVPlbm4tLdmfr/63asLS/cz20Y0Cbhpn22TiqbM8koQt
 q5/rJ3BZJQ/cgBylll0JHdP2yTeiXxYyWWpg5oJk4jF8mTq6oUAnBDOcXv6z/+2PN06i
 v/1g==
X-Gm-Message-State: AOJu0YyxKH5opkmACJG0fbGTbxQYMYmqaA7S17TItFCqB/R+WpOEexHh
 iGacNOl6bx2NfLBw0lU5Jv7qseKQQNlHC9KDhT8tQQ==
X-Google-Smtp-Source: AGHT+IGNd8Zyh1SuuCCalJuqfkJij1W8Z950z1DL0BW7grGmSYMkrmd9YuoBi5W65KCG6eZKQxoa4NdSsGzWynyaMVE=
X-Received: by 2002:ac2:4e85:0:b0:501:b029:1a47 with SMTP id
 o5-20020ac24e85000000b00501b0291a47mr58180lfr.1.1698647363870; Sun, 29 Oct
 2023 23:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CA+fCnZfn0RnnhifNxctrUaLEptE=z9L=e3BY_8tRH2UXZWAO6Q@mail.gmail.com>
 <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB07524EFBE97632D575A91EDB99A2A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 30 Oct 2023 07:29:10 +0100
Message-ID: <CACT4Y+a+xfzXBgqVz3Gxv4Ri1CqHTV1m=i=h4j5KWxsmdP+t5A@mail.gmail.com>
Subject: Re: [RFC] mm/kasan: Add Allocation, Free,
 Error timestamps to KASAN report
To: Juntong Deng <juntong.deng@outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Andrey Konovalov <andreyknvl@gmail.com>
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gU3VuLCAyOSBPY3QgMjAyMyBhdCAxMDowNSwgSnVudG9uZyBEZW5nIDxqdW50b25nLmRlbmdA
b3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy8xMC8yNiAzOjIyLCBBbmRyZXkgS29ub3Zh
bG92IHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgOTo0MOKAr1BNIEp1bnRvbmcg
RGVuZyA8anVudG9uZy5kZW5nQG91dGxvb2suY29tPiB3cm90ZToKPiA+Pgo+ID4+IFRoZSBpZGVh
IGNhbWUgZnJvbSB0aGUgYnVnIEkgd2FzIGZpeGluZyByZWNlbnRseSwKPiA+PiAnS0FTQU46IHNs
YWItdXNlLWFmdGVyLWZyZWUgUmVhZCBpbiB0bHNfZW5jcnlwdF9kb25lJy4KPiA+Pgo+ID4+IFRo
aXMgYnVnIGlzIGNhdXNlZCBieSBzdWJ0bGUgcmFjZSBjb25kaXRpb24sIHdoZXJlIHRoZSBkYXRh
IHN0cnVjdHVyZQo+ID4+IGlzIGZyZWVkIGVhcmx5IG9uIGFub3RoZXIgQ1BVLCByZXN1bHRpbmcg
aW4gdXNlLWFmdGVyLWZyZWUuCj4gPj4KPiA+PiBMaWtlIHRoaXMgYnVnLCBzb21lIG9mIHRoZSB1
c2UtYWZ0ZXItZnJlZSBidWdzIGFyZSBjYXVzZWQgYnkgcmFjZQo+ID4+IGNvbmRpdGlvbiwgYnV0
IGl0IGlzIG5vdCBlYXN5IHRvIHF1aWNrbHkgY29uY2x1ZGUgdGhhdCB0aGUgY2F1c2Ugb2YgdGhl
Cj4gPj4gdXNlLWFmdGVyLWZyZWUgaXMgcmFjZSBjb25kaXRpb24gaWYgb25seSBsb29raW5nIGF0
IHRoZSBzdGFjayB0cmFjZS4KPiA+Pgo+ID4+IEkgZGlkIG5vdCB0aGluayB0aGlzIHVzZS1hZnRl
ci1mcmVlIHdhcyBjYXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYXQgdGhlCj4gPj4gYmVnaW5uaW5n
LCBpdCB0b29rIG1lIHNvbWUgdGltZSB0byByZWFkIHRoZSBzb3VyY2UgY29kZSBjYXJlZnVsbHkg
YW5kCj4gPj4gdGhpbmsgYWJvdXQgaXQgdG8gZGV0ZXJtaW5lIHRoYXQgaXQgd2FzIGNhdXNlZCBi
eSByYWNlIGNvbmRpdGlvbi4KPiA+Pgo+ID4+IEJ5IGFkZGluZyB0aW1lc3RhbXBzIGZvciBBbGxv
Y2F0aW9uLCBGcmVlLCBhbmQgRXJyb3IgdG8gdGhlIEtBU0FOCj4gPj4gcmVwb3J0LCBpdCB3aWxs
IGJlIG11Y2ggZWFzaWVyIHRvIGRldGVybWluZSBpZiB1c2UtYWZ0ZXItZnJlZSBpcwo+ID4+IGNh
dXNlZCBieSByYWNlIGNvbmRpdGlvbi4KPiA+Cj4gPiBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0
byBhZGQgdGhlIENQVSBudW1iZXIgdG8gdGhlIGFsbG9jL2ZyZWUgc3RhY2sKPiA+IHRyYWNlcy4g
U29tZXRoaW5nIGxpa2U6Cj4gPgo+ID4gQWxsb2NhdGVkIGJ5IHRhc2sgNDIgb24gQ1BVIDI6Cj4g
PiAoc3RhY2sgdHJhY2UpCj4gPgo+ID4gVGhlIGJhZCBhY2Nlc3Mgc3RhY2sgdHJhY2UgYWxyZWFk
eSBwcmludHMgdGhlIENQVSBudW1iZXIuCj4KPiBZZXMsIHRoYXQgaXMgYSBncmVhdCBpZGVhIGFu
ZCB0aGUgQ1BVIG51bWJlciB3b3VsZCBoZWxwIGEgbG90Lgo+Cj4gQnV0IEkgdGhpbmsgdGhlIENQ
VSBudW1iZXIgY2Fubm90IGNvbXBsZXRlbHkgcmVwbGFjZSB0aGUgZnJlZSB0aW1lc3RhbXAsCj4g
YmVjYXVzZSBzb21lIGZyZWVpbmcgcmVhbGx5IHNob3VsZCBiZSBkb25lIGF0IGFub3RoZXIgQ1BV
Lgo+Cj4gV2UgbmVlZCB0aGUgZnJlZSB0aW1lc3RhbXAgdG8gaGVscCB1cyBkaXN0aW5ndWlzaCB3
aGV0aGVyIGl0IHdhcyBmcmVlZAo+IGEgbG9uZyB0aW1lIGFnbyBvciB3aGV0aGVyIGl0IHdhcyBj
YXVzZWQgdG8gYmUgZnJlZWQgZHVyaW5nIHRoZQo+IGN1cnJlbnQgb3BlcmF0aW9uLgo+Cj4gSSB0
aGluayBib3RoIHRoZSBDUFUgbnVtYmVyIGFuZCB0aGUgdGltZXN0YW1wIHNob3VsZCBiZSBkaXNw
bGF5ZWQsIG1vcmUKPiBpbmZvcm1hdGlvbiB3b3VsZCBoZWxwIHVzIGZpbmQgdGhlIHJlYWwgY2F1
c2Ugb2YgdGhlIGVycm9yIGZhc3Rlci4KPgo+IFNob3VsZCBJIGltcGxlbWVudCB0aGVzZSBmZWF0
dXJlcz8KCkhpIEp1bnRvbmcsCgpUaGVyZSBpcyBhbHNvIGFuIGFzcGVjdCBvZiBtZW1vcnkgY29u
c3VtcHRpb24uIEtBU0FOIGhlYWRlcnMgaW5jcmVhc2UKdGhlIHNpemUgb2YgZXZlcnkgaGVhcCBv
YmplY3QuIFNvIHdlIHRyaWVkIHRvIGtlZXAgdGhlbSBhcyBjb21wYWN0IGFzCnBvc3NpYmxlLiBB
dCBzb21lIHBvaW50IENQVSBudW1iZXJzIGFuZCB0aW1lc3RhbXBzIChJSVJDKSB3ZXJlIGFscmVh
ZHkKcGFydCBvZiB0aGUgaGVhZGVyLCBidXQgd2UgcmVtb3ZlZCB0aGVtIHRvIHNocmluayB0aGUg
aGVhZGVyIHRvIDE2CmJ5dGVzLgpQSUQgZ2l2ZXMgYSBnb29kIGFwcHJveGltYXRpb24gb2YgcG90
ZW50aWFsIHJhY2VzLiBJIHVzdWFsbHkgbG9vayBhdApQSURzIHRvIHVuZGVyc3RhbmQgaWYgaXQn
cyBhICJwbGFpbiBvbGQgc2luZ2xlLXRocmVhZGVkCnVzZS1hZnRlci1mcmVlIiwgb3IgZnJlZSBh
bmQgYWNjZXNzIGhhcHBlbmVkIGluIGRpZmZlcmVudCB0aHJlYWRzLgpSZSB0aW1lc3RhbXBzLCBJ
IHNlZSB5b3UgcmVmZXJlbmNlZCBhIHN5emJvdCByZXBvcnQuIFdpdGggc3l6a2FsbGVyCm1vc3Qg
dGltZXN0YW1wcyB3aWxsIGJlIHZlcnkgY2xvc2UgZXZlbiBmb3Igbm9uLXJhY2luZyBjYXNlLgpT
byBpZiB0aGlzIGlzIGFkZGVkLCB0aGlzIHNob3VsZCBiZSBhZGRlZCBhdCBsZWFzdCB1bmRlciBh
IHNlcGFyYXRlIGNvbmZpZy4KCklmIHlvdSBhcmUgbG9va2luZyBmb3IgcG90ZW50aWFsIEtBU0FO
IGltcHJvdmVtZW50cywgaGVyZSBpcyBhIGdvb2QgbGlzdDoKaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL2J1Z2xpc3QuY2dpP2J1Z19zdGF0dXM9X19vcGVuX18mY29tcG9uZW50PVNhbml0aXpl
cnMmbGlzdF9pZD0xMTM0MTY4JnByb2R1Y3Q9TWVtb3J5JTIwTWFuYWdlbWVudApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVl
cyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1rZXJuZWwtbWVudGVlcwo=
