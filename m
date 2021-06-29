Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BB7C11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 19:32:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3732F61DDE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 19:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3732F61DDE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F28CC40105;
	Tue, 29 Jun 2021 19:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojPFg-JgFXtj; Tue, 29 Jun 2021 19:32:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D6614403EF;
	Tue, 29 Jun 2021 19:32:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFC7AC001A;
	Tue, 29 Jun 2021 19:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDA66C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D59BD83A64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dubeyko-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLYe0YeUXuMp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:32:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0200C83A57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 19:32:04 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 s10-20020a4aeaca0000b029024c2acf6eecso4732796ooh.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NnGqF5i8LvWI4EhF9coOqefPqY2kcPhPYW+PqMZT3MI=;
 b=AkbnlocjnC9D/sMNkHUTlQe2l961wltIILRlW75VEZby9nkNErd0f3GilLrcB4o+Xk
 NBA8dsUIamjOMhh6JLoGP5/zQij1UUSqR5lFQeV2ICN6dPG2Bxm3k57/sHOwePkibIO3
 /9rwK3EHtYDgS7hmGQPnBHCqXOKlHAmNTF9yQEo7WmlbVpx9woJZWT/P6fAJmrpWfo5b
 Ha4kXdOtZQiI3Ypk4oiT1ZIT1/iFKA4FUoJjY9AgehKKSr++Ek5AE1DySFmlB6RBxW1k
 nk5xBbj0eqMZMWcMAXpPWxmkHJn8TSgfMRvirHiSPigg58hqE1Wsu86A8Mo9AmURbS+L
 QYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NnGqF5i8LvWI4EhF9coOqefPqY2kcPhPYW+PqMZT3MI=;
 b=YZvbid77tgglvxhaJEBekTl15vB5AQQ9Qlsrs8S6LWcKAs4oUez8ka8Yaqw3/05j3l
 U2r4hxsmOMA8gt4Eyoe+ibZ+duMxLb2S4TnMTBxnVG0j4VXOXSIM1qC9tQtzOnA2xBIV
 ThDDLbTNawTWO71p7QUi6ivhMi7oj7shoek0Eo6StNvV7k6CAzzQtrQvQpycxaikfyef
 60qv6g/dskhqqyOZhsptoD7FnIcqm8HjQSy9cniPYffHij03aNIKwThBINQrC+CfOp3Y
 jjQRpeHiq0TlzZbvg+ASMQRWFLwWrc1s7FPDdf7Y1Tx0YggFqJMIzAPLdMto2OpjaTwf
 cpZg==
X-Gm-Message-State: AOAM530U63vUphNKuYh7q4L+rd0tzmX3Vso2jjfqZvIvLe2ovdNGKvTO
 2NWMmQWeOSNB8uGXxn5COwyXwA==
X-Google-Smtp-Source: ABdhPJzMAoJNlT4cn96farSb/2+ZZVyAAujQ8xgfMZFGEYPL43QFmc07ld1kFpq0GFHajFV/ZsdXyA==
X-Received: by 2002:a4a:956f:: with SMTP id n44mr5400466ooi.54.1624995124003; 
 Tue, 29 Jun 2021 12:32:04 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:f8e3:a853:8646:6bc8])
 by smtp.gmail.com with ESMTPSA id k14sm2522483oon.5.2021.06.29.12.32.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Jun 2021 12:32:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 2/3] hfs: fix high memory mapping in hfs_bnode_read
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <20210629144803.62541-3-desmondcheongzx@gmail.com>
Date: Tue, 29 Jun 2021 12:31:58 -0700
Message-Id: <4E2B2BE9-3C0F-4D99-A099-601A780E0CED@dubeyko.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
 <20210629144803.62541-3-desmondcheongzx@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: linux-kernel@vger.kernel.org, gustavoars@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Cgo+IE9uIEp1biAyOSwgMjAyMSwgYXQgNzo0OCBBTSwgRGVzbW9uZCBDaGVvbmcgWmhpIFhpIDxk
ZXNtb25kY2hlb25nenhAZ21haWwuY29tPiB3cm90ZToKPiAKPiBQYWdlcyB0aGF0IHdlIHJlYWQg
aW4gaGZzX2Jub2RlX3JlYWQgbmVlZCB0byBiZSBrbWFwcGVkIGludG8ga2VybmVsCj4gYWRkcmVz
cyBzcGFjZS4gSG93ZXZlciwgY3VycmVudGx5IG9ubHkgdGhlIDB0aCBwYWdlIGlzIGttYXBwZWQu
IElmIHRoZQo+IGdpdmVuIG9mZnNldCArIGxlbmd0aCBleGNlZWRzIHRoaXMgMHRoIHBhZ2UsIHRo
ZW4gd2UgaGF2ZSBhbiBpbnZhbGlkCj4gbWVtb3J5IGFjY2Vzcy4KPiAKPiBUbyBmaXggdGhpcywg
d2UgdXNlIHRoZSBzYW1lIGxvZ2ljIHVzZWQgIGluIGhmc3BsdXMnIHZlcnNpb24gb2YKPiBoZnNf
Ym5vZGVfcmVhZCB0byBrbWFwIGVhY2ggcGFnZSBvZiByZWxldmFudCBkYXRhIHRoYXQgd2UgY29w
eS4KPiAKPiBBbiBleGFtcGxlIG9mIGludmFsaWQgbWVtb3J5IGFjY2VzcyBvY2N1cnJpbmcgd2l0
aG91dCB0aGlzIGZpeCBjYW4gYmUKPiBzZWVuIGluIHRoZSBmb2xsb3dpbmcgY3Jhc2ggcmVwb3J0
Ogo+IAo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+IEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIG1lbWNweSBp
bmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6MTkxIFtpbmxpbmVdCj4gQlVHOiBLQVNBTjog
dXNlLWFmdGVyLWZyZWUgaW4gaGZzX2Jub2RlX3JlYWQrMHhjNC8weGUwIGZzL2hmcy9ibm9kZS5j
OjI2Cj4gUmVhZCBvZiBzaXplIDIgYXQgYWRkciBmZmZmODg4MTI1ZmRjZmZlIGJ5IHRhc2sgc3l6
LWV4ZWN1dG9yNS80NjM0Cj4gCj4gQ1BVOiAwIFBJRDogNDYzNCBDb21tOiBzeXotZXhlY3V0b3I1
IE5vdCB0YWludGVkIDUuMTMuMC1zeXprYWxsZXIgIzAKPiBIYXJkd2FyZSBuYW1lOiBHb29nbGUg
R29vZ2xlIENvbXB1dGUgRW5naW5lL0dvb2dsZSBDb21wdXRlIEVuZ2luZSwgQklPUyBHb29nbGUg
MDEvMDEvMjAxMQo+IENhbGwgVHJhY2U6Cj4gX19kdW1wX3N0YWNrIGxpYi9kdW1wX3N0YWNrLmM6
NzkgW2lubGluZV0KPiBkdW1wX3N0YWNrKzB4MTk1LzB4MWY4IGxpYi9kdW1wX3N0YWNrLmM6MTIw
Cj4gcHJpbnRfYWRkcmVzc19kZXNjcmlwdGlvbi5jb25zdHByb3AuMCsweDFkLzB4MTEwIG1tL2th
c2FuL3JlcG9ydC5jOjIzMwo+IF9fa2FzYW5fcmVwb3J0IG1tL2thc2FuL3JlcG9ydC5jOjQxOSBb
aW5saW5lXQo+IGthc2FuX3JlcG9ydC5jb2xkKzB4N2IvMHhkNCBtbS9rYXNhbi9yZXBvcnQuYzo0
MzYKPiBjaGVja19yZWdpb25faW5saW5lIG1tL2thc2FuL2dlbmVyaWMuYzoxODAgW2lubGluZV0K
PiBrYXNhbl9jaGVja19yYW5nZSsweDE1NC8weDFiMCBtbS9rYXNhbi9nZW5lcmljLmM6MTg2Cj4g
bWVtY3B5KzB4MjQvMHg2MCBtbS9rYXNhbi9zaGFkb3cuYzo2NQo+IG1lbWNweSBpbmNsdWRlL2xp
bnV4L2ZvcnRpZnktc3RyaW5nLmg6MTkxIFtpbmxpbmVdCj4gaGZzX2Jub2RlX3JlYWQrMHhjNC8w
eGUwIGZzL2hmcy9ibm9kZS5jOjI2Cj4gaGZzX2Jub2RlX3JlYWRfdTE2IGZzL2hmcy9ibm9kZS5j
OjM0IFtpbmxpbmVdCj4gaGZzX2Jub2RlX2ZpbmQrMHg4ODAvMHhjYzAgZnMvaGZzL2Jub2RlLmM6
MzY1Cj4gaGZzX2JyZWNfZmluZCsweDJkOC8weDU0MCBmcy9oZnMvYmZpbmQuYzoxMjYKPiBoZnNf
YnJlY19yZWFkKzB4MjcvMHgxMjAgZnMvaGZzL2JmaW5kLmM6MTY1Cj4gaGZzX2NhdF9maW5kX2Jy
ZWMrMHgxOWEvMHgzYjAgZnMvaGZzL2NhdGFsb2cuYzoxOTQKPiBoZnNfZmlsbF9zdXBlcisweGMx
My8weDE0NjAgZnMvaGZzL3N1cGVyLmM6NDE5Cj4gbW91bnRfYmRldisweDMzMS8weDNmMCBmcy9z
dXBlci5jOjEzNjgKPiBoZnNfbW91bnQrMHgzNS8weDQwIGZzL2hmcy9zdXBlci5jOjQ1Nwo+IGxl
Z2FjeV9nZXRfdHJlZSsweDEwYy8weDIyMCBmcy9mc19jb250ZXh0LmM6NTkyCj4gdmZzX2dldF90
cmVlKzB4OTMvMHgzMDAgZnMvc3VwZXIuYzoxNDk4Cj4gZG9fbmV3X21vdW50IGZzL25hbWVzcGFj
ZS5jOjI5MDUgW2lubGluZV0KPiBwYXRoX21vdW50KzB4MTNmNS8weDIwZTAgZnMvbmFtZXNwYWNl
LmM6MzIzNQo+IGRvX21vdW50IGZzL25hbWVzcGFjZS5jOjMyNDggW2lubGluZV0KPiBfX2RvX3N5
c19tb3VudCBmcy9uYW1lc3BhY2UuYzozNDU2IFtpbmxpbmVdCj4gX19zZV9zeXNfbW91bnQgZnMv
bmFtZXNwYWNlLmM6MzQzMyBbaW5saW5lXQo+IF9feDY0X3N5c19tb3VudCsweDJiOC8weDM0MCBm
cy9uYW1lc3BhY2UuYzozNDMzCj4gZG9fc3lzY2FsbF82NCsweDM3LzB4YzAgYXJjaC94ODYvZW50
cnkvY29tbW9uLmM6NDcKPiBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGFl
Cj4gUklQOiAwMDMzOjB4NDVlNjNhCj4gQ29kZTogNDggYzcgYzIgYmMgZmYgZmYgZmYgZjcgZDgg
NjQgODkgMDIgYjggZmYgZmYgZmYgZmYgZWIgZDIgZTggODggMDQgMDAgMDAgMGYgMWYgODQgMDAg
MDAgMDAgMDAgMDAgNDkgODkgY2EgYjggYTUgMDAgMDAgMDAgMGYgMDUgPDQ4PiAzZCAwMSBmMCBm
ZiBmZiA3MyAwMSBjMyA0OCBjNyBjMSBiYyBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OAo+IFJT
UDogMDAyYjowMDAwN2Y5NDA0ZDQxMGQ4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAw
MDAwMDAwMDAwYTUKPiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMDIwMDAwMjQ4
IFJDWDogMDAwMDAwMDAwMDQ1ZTYzYQo+IFJEWDogMDAwMDAwMDAyMDAwMDAwMCBSU0k6IDAwMDAw
MDAwMjAwMDAxMDAgUkRJOiAwMDAwN2Y5NDA0ZDQxMTIwCj4gUkJQOiAwMDAwN2Y5NDA0ZDQxMTIw
IFIwODogMDAwMDAwMDAyMDAwMDJjMCBSMDk6IDAwMDAwMDAwMjAwMDAwMDAKPiBSMTA6IDAwMDAw
MDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMwo+
IFIxMzogMDAwMDAwMDAwMDAwMDAwMyBSMTQ6IDAwMDAwMDAwMDA0YWQ1ZDggUjE1OiAwMDAwMDAw
MDAwMDAwMDAwCj4gCj4gVGhlIGJ1Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgcGFnZToKPiBw
YWdlOjAwMDAwMDAwZGFkYmNmM2UgcmVmY291bnQ6MCBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAw
MDAwMDAwMDAwMCBpbmRleDoweDEgcGZuOjB4MTI1ZmRjCj4gZmxhZ3M6IDB4MmZmZmMwMDAwMDAw
MDAwKG5vZGU9MHx6b25lPTJ8bGFzdGNwdXBpZD0weDNmZmYpCj4gcmF3OiAwMmZmZmMwMDAwMDAw
MDAwIGZmZmZlYTAwMDQ5N2Y3NDggZmZmZmVhMDAwNDk3ZjZjOCAwMDAwMDAwMDAwMDAwMDAwCj4g
cmF3OiAwMDAwMDAwMDAwMDAwMDAxIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDBmZmZmZmZmZiAw
MDAwMDAwMDAwMDAwMDAwCj4gcGFnZSBkdW1wZWQgYmVjYXVzZToga2FzYW46IGJhZCBhY2Nlc3Mg
ZGV0ZWN0ZWQKPiAKPiBNZW1vcnkgc3RhdGUgYXJvdW5kIHRoZSBidWdneSBhZGRyZXNzOgo+IGZm
ZmY4ODgxMjVmZGNlODA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmCj4gZmZmZjg4ODEyNWZkY2YwMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYKPj4gZmZmZjg4ODEyNWZkY2Y4MDogZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gZmZmZjg4ODEyNWZkZDAw
MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYKPiBmZmZm
ODg4MTI1ZmRkMDgwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZgo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+IAo+IFNpZ25lZC1vZmYtYnk6IERlc21vbmQgQ2hlb25nIFpoaSBY
aSA8ZGVzbW9uZGNoZW9uZ3p4QGdtYWlsLmNvbT4KPiAtLS0KPiBmcy9oZnMvYm5vZGUuYyB8IDE4
ICsrKysrKysrKysrKysrLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9oZnMvYm5vZGUuYyBiL2ZzL2hmcy9i
bm9kZS5jCj4gaW5kZXggYjYzYTRkZjczMjdiLi45MzZjZmE3NjMyMjQgMTAwNjQ0Cj4gLS0tIGEv
ZnMvaGZzL2Jub2RlLmMKPiArKysgYi9mcy9oZnMvYm5vZGUuYwo+IEBAIC0xOCwxMyArMTgsMjMg
QEAKPiB2b2lkIGhmc19ibm9kZV9yZWFkKHN0cnVjdCBoZnNfYm5vZGUgKm5vZGUsIHZvaWQgKmJ1
ZiwKPiAJCWludCBvZmYsIGludCBsZW4pCj4gewo+IC0Jc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gKwlz
dHJ1Y3QgcGFnZSAqKnBhZ2VwOwo+ICsJaW50IGw7Cj4gCj4gCW9mZiArPSBub2RlLT5wYWdlX29m
ZnNldDsKPiAtCXBhZ2UgPSBub2RlLT5wYWdlWzBdOwo+ICsJcGFnZXAgPSBub2RlLT5wYWdlICsg
KG9mZiA+PiBQQUdFX1NISUZUKTsKCkkgd291bGQgbGlrZSB0byBoYXZlIGEgY2hlY2sgaGVyZSB0
aGF0IHdlIGFyZSBub3Qgb3V0IG9mIHRoZSBwYWdlIGFycmF5LiBDb3VsZCB5b3UgYWRkIHRoaXMg
Y2hlY2s/CgpBbHNvLCBtYXliZSwgbm9kZS0+cGFnZVtpbmRleF0gY291bGQgbG9vayBtdWNoIHNh
ZmVyIGhlcmUuIFdoYXQgZG8geW91IHRoaW5rPwoKPiArCW9mZiAmPSB+UEFHRV9NQVNLOwo+IAo+
IC0JbWVtY3B5KGJ1Ziwga21hcChwYWdlKSArIG9mZiwgbGVuKTsKPiAtCWt1bm1hcChwYWdlKTsK
PiArCWwgPSBtaW5fdChpbnQsIGxlbiwgUEFHRV9TSVpFIC0gb2ZmKTsKCk1heWJlLCBpdCBtYWtl
cyBzZW5zZSB0byB1c2UgbW9yZSBpbmZvcm1hdGl2ZSBuYW1lIG9mIHRoZSB2YXJpYWJsZSBpbnN0
ZWFkIG9mIOKAnGzigJ0/Cgo+ICsJbWVtY3B5KGJ1Ziwga21hcCgqcGFnZXApICsgb2ZmLCBsKTsK
Ckkgc3VwcG9zZSB0aGF0IGl0IGNvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhIGNoZWNrIHRoYXQgd2Ug
ZG8gbm90IG92ZXJmbG93IHRoZSBidWZmZXIuIEhvdyBkbyB5b3UgZmVlbCBhYm91dCBpdD8KCj4g
KwlrdW5tYXAoKnBhZ2VwKTsKCldoYXTigJlzIGFib3V0IGttYXBfYXRvbWljL2t1bm1hcF9hdG9t
aWMgaW4gdGhpcyBmdW5jdGlvbj8KClRoYW5rcywKU2xhdmEuCgo+ICsKPiArCXdoaWxlICgobGVu
IC09IGwpICE9IDApIHsKPiArCQlidWYgKz0gbDsKPiArCQlsID0gbWluX3QoaW50LCBsZW4sIFBB
R0VfU0laRSk7Cj4gKwkJbWVtY3B5KGJ1Ziwga21hcCgqKytwYWdlcCksIGwpOwo+ICsJCWt1bm1h
cCgqcGFnZXApOwo+ICsJfQo+IH0KPiAKPiB1MTYgaGZzX2Jub2RlX3JlYWRfdTE2KHN0cnVjdCBo
ZnNfYm5vZGUgKm5vZGUsIGludCBvZmYpCj4gLS0gCj4gMi4yNS4xCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
