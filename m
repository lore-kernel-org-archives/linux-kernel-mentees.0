Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D0AEE4996
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Aug 2023 14:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6956A611BD;
	Tue, 22 Aug 2023 14:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6956A611BD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bj7XacAv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6MC_Oxt5MzK; Tue, 22 Aug 2023 14:35:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0884860864;
	Tue, 22 Aug 2023 14:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0884860864
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D10E2C0039;
	Tue, 22 Aug 2023 14:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0E03C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 14:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B88D4056A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 14:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B88D4056A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Bj7XacAv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPsPjnRop3gX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 14:35:01 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D8F54014D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 14:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D8F54014D
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7a25184a648so1076808241.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Aug 2023 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692714900; x=1693319700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+ZNfPtU0Cttw+VeDpq9OnUhCaE60SVpp2lMWarUKUc=;
 b=Bj7XacAvfZ6coerNUiXEwJdKVf0xGC+OXqZOwA3lUpa0JTkpxgekOtmtlCEoHSHDle
 0rdnLCQK5kZHsIJpziI+2ieYFVI0Q3BIg3STTzrNcv29doMqCMlw2lLNYqQutEBCjNvA
 fPvDYrqsSQAyEl5JiSCdsiOGyoW0E6jitN37eev4m62r96FccmWTjz3VtAWT28dQZQyE
 zP5f5qCwIYqz4IqGIi3GXHNKSPsRmbb86pq8pSmUJymLPTy1gE9ysg262GMr13XF06r0
 j+me8PoNw2hZAZnF1/BADEZRRkyc22+pJmq0cueWsivAxvSA5rXNdItT5DrEPRzEMMLn
 kGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692714900; x=1693319700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+ZNfPtU0Cttw+VeDpq9OnUhCaE60SVpp2lMWarUKUc=;
 b=K/7tEWaIGyZYadw83qmcbucVK6wVkdsi7MhnvlNT1ffs2bhv9W7m7kG1Km5+fiK4vP
 0qG+mzee5wdo8pf8aLhCiQoXiqRrp6Zf9qO+a/5fsLF497Frrlr35SK78KtwM+Oog/bc
 M7y+1ATSQ4CndFTehReHPzw0mmiOk65UuZbVkoTEuCab2P8W/usZ8jb5R8mHvcr+lxKA
 WKYjKYDs0gq1FTgvaWSwLvJxxW+ZeM/GvTFH+P3adIHKfW8y+5+nQUNkbrpeLoYIznM8
 Kws3V7kKLJmnvQ7tf/QlgLEHNpnVQIIjYJtrMH9CsYox/9g1yqBGF19gKpkgB7T8HpU6
 twMg==
X-Gm-Message-State: AOJu0YwQqM+u0UNzt6Z/4CY5F9v5Jf7Avev/CGADpUtP4JDlYDQe2oY4
 MO/SK1P7+fOm3uaWXUAJyzdgh6nymDE/LCisKYw=
X-Google-Smtp-Source: AGHT+IEvbFTcsJ11ZJwXI8CgYZaY1++rsw/zqgyPEs0rJFQr7S29crCoaZwGW1YOUQIFFNY97PInmJjBGmiMX7a+ttA=
X-Received: by 2002:a05:6102:2446:b0:44d:5b62:bcd5 with SMTP id
 g6-20020a056102244600b0044d5b62bcd5mr2330918vss.23.1692714900235; Tue, 22 Aug
 2023 07:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
 <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
 <64e22df53d1e6_3580162945b@willemb.c.googlers.com.notmuch>
 <7e8c2597c71647f38cd4672cbef53a66@AcuMS.aculab.com>
In-Reply-To: <7e8c2597c71647f38cd4672cbef53a66@AcuMS.aculab.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 22 Aug 2023 10:34:23 -0400
Message-ID: <CAF=yD-+6cWTiDgpsu=hUV+OvzDFRaT2ZUmtQo9qTrCB9i-+7ng@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests: Provide local define of min() and max()
To: David Laight <David.Laight@aculab.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
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

T24gTW9uLCBBdWcgMjEsIDIwMjMgYXQgOTowNeKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogV2lsbGVtIGRlIEJydWlqbgo+ID4gU2Vu
dDogU3VuZGF5LCBBdWd1c3QgMjAsIDIwMjMgNDoxNSBQTQo+ID4KPiA+IE1haG1vdWQgTWFhdHVx
IHdyb3RlOgo+ID4gPiB0byBhdm9pZCBtYW51YWwgY2FsY3VsYXRpb24gb2YgbWluIGFuZCBtYXgg
dmFsdWVzCj4gPiA+IGFuZCBmaXggY29jY2luZWxsZSB3YXJuaW5ncyBzdWNoIFdBUk5JTkcgb3Bw
b3J0dW5pdHkgZm9yIG1pbigpL21heCgpCj4gPiA+IGFkZGluZyBvbmUgY29tbW9uIGRlZmluaXRp
b24gdGhhdCBjb3VsZCBiZSB1c2VkIGluIG11bHRpcGxlIGZpbGVzCj4gPiA+IHVuZGVyIHNlbGZ0
ZXN0cy4KPiA+ID4gdGhlcmUgYXJlIGFsc28gc29tZSBkZWZpbmVzIGZvciBtaW4vbWF4IHNjYXR0
ZXJlZCBsb2NhbGx5IGluc2lkZSBzb3VyY2VzCj4gPiA+IHVuZGVyIHNlbGZ0ZXN0cy4KPiA+ID4g
dGhpcyBhbHNvIHByZXBhcmVzIGZvciBjbGVhbmluZyB1cCB0aG9zZSByZWR1bmRhbnQgZGVmaW5l
cyBhbmQgaW5jbHVkZQo+ID4gPiBrc2VsZnRlc3QuaCBpbnN0ZWFkLgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYWhtb3VkIE1hYXR1cSA8bWFobW91ZG1hdG9vay5tbUBnbWFpbC5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0LmggfCA3ICsr
KysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdC5oIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0LmgKPiA+ID4gaW5kZXggODI5YmUzNzk1NDVhLi5l
OGViN2U5YWZiYzYgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tz
ZWxmdGVzdC5oCj4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdC5o
Cj4gPiA+IEBAIC01NSw2ICs1NSwxMyBAQAo+ID4gPiAgI2RlZmluZSBBUlJBWV9TSVpFKGFycikg
KHNpemVvZihhcnIpIC8gc2l6ZW9mKChhcnIpWzBdKSkKPiA+ID4gICNlbmRpZgo+ID4gPgo+ID4g
PiArI2lmbmRlZiBtaW4KPiA+ID4gKyMgZGVmaW5lIG1pbih4LCB5KSAoKHgpIDwgKHkpID8gKHgp
IDogKHkpKQo+ID4gPiArI2VuZGlmCj4gPiA+ICsjaWZuZGVmIG1heAo+ID4gPiArIyBkZWZpbmUg
bWF4KHgsIHkpICgoeCkgPCAoeSkgPyAoeSkgOiAoeCkpCj4gPiA+ICsjZW5kaWYKPiA+ID4gKwo+
ID4KPiA+IFNob3VsZCB0aGlzIG1vcmUgY2xvc2VseSBmb2xsb3cgaW5jbHVkZS9saW51eC9taW5t
YXguaCwgd2hpY2ggaXMgYSBsb3QKPiA+IG1vcmUgc3RyaWN0Pwo+ID4KPiA+IEknbSBmaW5lIHdp
dGggdGhpcyBzaW1wbGVyLCBtb3JlIHJlbGF4ZWQsIHZlcnNpb24gZm9yIHRlc3RpbmcsIGJ1dAo+
ID4gY2FsbGluZyBpdCBvdXQgZm9yIHBlb3BsZSB0byBzcGVhayB1cC4KPiA+Cj4gPiBPbmx5IHRo
ZSBmaXJzdCB0d28gb2YgdGhlc2UgY29tbWVudHMgaW4gbWlubWF4LmggYXBwbHkgdG8gdGhpcwo+
ID4gdXNlcnNwYWNlIGNvZGUuCj4gPgo+ID4gLyoKPiA+ICAqIG1pbigpL21heCgpL2NsYW1wKCkg
bWFjcm9zIG11c3QgYWNjb21wbGlzaCB0aHJlZSB0aGluZ3M6Cj4gPiAgKgo+ID4gICogLSBhdm9p
ZCBtdWx0aXBsZSBldmFsdWF0aW9ucyBvZiB0aGUgYXJndW1lbnRzIChzbyBzaWRlLWVmZmVjdHMg
bGlrZQo+ID4gICogICAieCsrIiBoYXBwZW4gb25seSBvbmNlKSB3aGVuIG5vbi1jb25zdGFudC4K
PiA+ICAqIC0gcGVyZm9ybSBzdHJpY3QgdHlwZS1jaGVja2luZyAodG8gZ2VuZXJhdGUgd2Fybmlu
Z3MgaW5zdGVhZCBvZgo+ID4gICogICBuYXN0eSBydW50aW1lIHN1cnByaXNlcykuIFNlZSB0aGUg
InVubmVjZXNzYXJ5IiBwb2ludGVyIGNvbXBhcmlzb24KPiA+ICAqICAgaW4gX190eXBlY2hlY2so
KS4KPiA+ICAqIC0gcmV0YWluIHJlc3VsdCBhcyBhIGNvbnN0YW50IGV4cHJlc3Npb25zIHdoZW4g
Y2FsbGVkIHdpdGggb25seQo+ID4gICogICBjb25zdGFudCBleHByZXNzaW9ucyAodG8gYXZvaWQg
dHJpcHBpbmcgVkxBIHdhcm5pbmdzIGluIHN0YWNrCj4gPiAgKiAgIGFsbG9jYXRpb24gdXNhZ2Up
Lgo+ID4gICovCj4gPgo+ID4gTm90ZSB0aGF0IGEgbW9yZSBzdHJpY3QgdmVyc2lvbiB0aGF0IGlu
Y2x1ZGVzIF9fdHlwZWNoZWNrIHdvdWxkCj4gPiB3YXJuIG9uIHRoZSB0eXBlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0b3RhbF9sZW4gYW5kIGNmZ19tc3MuIEZpbmUKPiA+IHdpdGggY2hhbmdpbmcgdGhl
IHR5cGUgb2YgY2ZnX21zcyBpbiB0aGUgZm9sbG93LW9uIHBhdGNoIHRvIGFkZHJlc3MKPiA+IHRo
YXQuCj4KPiBUaGF0IHR5cGVjaGVjaygpIGlzIGhvcnJpZC4KPiBJdCBtYXkgd2VsbCBoYXZlIGNh
dXNlZCBtb3JlIGJ1Z3MgZHVlIHRvIGluY29ycmVjdCBjYXN0cyB0aGF0Cj4gaXQgYWN0dWFsbHkg
ZGV0ZWN0ZWQuCj4KPiBJJ2Qgc3VnZ2VzdCB0aGUgdmVyc2lvbiB0aGF0IGp1c3QgYXZvaWRzIG11
bHRpcGxlIGV2YWx1YXRpb25zLgo+IE9yIGp1c3QgZXJyb3Igc2lnbmVkIHYgdW5zaWduZWQgY29t
cGFyaXNvbnMuCj4gU2VlICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYjRjZTlkYWQ3NDhl
NDg5ZjkzMTRhMmRjOTU2MTUwMzNAQWN1TVMuYWN1bGFiLmNvbS8KPiBmb3IgYW4gZXhhbXBsZSBw
YXRjaCBzZXQuCgpJbnRlcmVzdGluZywgdGhhbmtzLiBUaGF0IGlzIGFsc28gc2ltcGxlci4KCkFs
c28sIHRoZSBleGlzdGluZyBwYXRjaCBpcyBubyB3b3JzZSB0aGFuIHRoZSBvcGVuIGNvZGVkIGNv
ZGUgdG9kYXksCnNvIGV2ZW4gd2l0aG91dCBjb2RlIHRvIGF2b2lkIG11bHRpcGxlIGV2YWx1YXRp
b25zLCBJIGd1ZXNzIGl0J3Mgb2theQp0byBtZXJnZS4KClRoZSBjb2NjaW5lbGxlIHdhcm5pbmdz
IGFyZSBhcmd1YWJseSBmYWxzZSBwb3NpdGl2ZXMsIHVzaW5nIGNoZWNrcyBmb3IKa2VybmVsIGNv
ZGUsIGJ1dCBiZWluZyBydW4gYWdhaW5zdCB1c2Vyc3BhY2UgY29kZSB0aGF0IGhhcyBubyBhY2Nl
c3MKdG8gdGhvc2UgaGVscGVycy4gQnV0IGZpbmUgdG8gc2lsZW5jZSB0aGVtLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVl
cyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1rZXJuZWwtbWVudGVlcwo=
