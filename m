Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DFBC6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Mar 2023 17:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C9081D3A;
	Sat, 11 Mar 2023 17:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C9081D3A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bvh9trzB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYMeOgoJ5KME; Sat, 11 Mar 2023 17:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8F70F81C93;
	Sat, 11 Mar 2023 17:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F70F81C93
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75C2EC0071;
	Sat, 11 Mar 2023 17:30:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 350B7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1091D4046D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1091D4046D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bvh9trzB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9b2qOJh9CBDj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBBA400C4
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFBBA400C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 17:30:36 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id h17so2998362qka.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Mar 2023 09:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678555836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uU6dGrt2rIzrhCnJXbaQHOas3xv+F1JDdAfTJ+oW/RQ=;
 b=bvh9trzBAS2l2m1h0HCxqnySScFOuROTEyTiIMTBeF8PQP2OWZqPqWC3cGECLhcwAH
 6anXClkJjl9COgnOAanr4FE3271F1yJqo/9lpTUV6ep6IJQpkiwRWfoU0uoZJCZEqVHi
 ysV2zp6JFgFx+r4XQbRJ435KksJeyyF2JlgJGhe0G5J6XH2E6xs4sYHAMW8XVCqOdMBS
 bW4h09gR02iQfeF+bjjP8LPJqMFDEcHEMWLjSmMSfw+zpO/54/GLaN/qWhXk54lvwbmj
 09Shs0n/oW3/dUfuLdTCzHBKhkqIZZals5Rj5dpXybe/FvZTGTWh3skuEE2aFRyBW20j
 vkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678555836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uU6dGrt2rIzrhCnJXbaQHOas3xv+F1JDdAfTJ+oW/RQ=;
 b=4xXuWwXvdDKhx+l2/4dqOOhZrBEqSdVb+oMnRuOtv2VT6kiojvpc1zkTupUzS1+cZd
 IO6Sxq6V1HmE/K8aPBi/Cera/EPBsnhYYsyGjtcSezETi3p1kkk8v5U8Yivb0fLPJLxr
 xtslrk5bO28J6+WJ0OvKVfwEcvyHKSEFvvfYkSBnYt/iN9IecIcqAMCVw6n8da5j1RNr
 hy6S0E6A8HGn4jTfm3pmFn5ICW3rfXqI26Wp9fs4qcVFo30JoRRqAC8LZndj0RG9Jq7h
 KimwI91wOqlOUM9xdzjAvQHr/tOMJjYFcr88J0IlotlY+VAkRFXHUaHKE5SZv1G3tWQ5
 73DA==
X-Gm-Message-State: AO0yUKVcXnhKdFaIf2YQ+Vkt+eDPYGS4Pang/KW8qmqhDwyONVUDlVq0
 TAinW6kyyrQ1swjeAlz3t7Nm4lwQKIBQfTqxc9U=
X-Google-Smtp-Source: AK7set+cugWP5zKt6KMIC6m8i+hg8Ut3Qze/upRlJFEFI+Q72RtsBkvvN4MVyja5eqWo2xLoK7aPOAxioOApHIXudEQ=
X-Received: by 2002:a37:64c1:0:b0:72d:4b50:f156 with SMTP id
 y184-20020a3764c1000000b0072d4b50f156mr1491924qkb.14.1678555835734; Sat, 11
 Mar 2023 09:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
In-Reply-To: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
From: David Kahurani <k.kahurani@gmail.com>
Date: Sat, 11 Mar 2023 20:30:24 +0300
Message-ID: <CAAZOf27oFt=+DndvUxFLoRM8u_+oUs-Bdtca=yoBT0e-ych3Lw@mail.gmail.com>
Subject: Re: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: lucho@ionkov.net, ericvh@gmail.com, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, linux-kernel@vger.kernel.org,
 syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com,
 v9fs-developer@lists.sourceforge.net,
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMTE6MjjigK9QTSBJdmFuIE9ybG92IDxpdmFuLm9ybG92
MDMyMkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gS0FTQU4gcmVwb3J0ZWQgdGhlIGZvbGxvd2luZyBp
c3N1ZToKPiBbICAgMzYuODI1ODE3XVsgVDU5MjNdIEJVRzogS0FTQU46IHdpbGQtbWVtb3J5LWFj
Y2VzcyBpbiB2OWZzX2dldF9hY2wrMHgxYTQvMHgzOTAKPiBbICAgMzYuODI3NDc5XVsgVDU5MjNd
IFdyaXRlIG9mIHNpemUgNCBhdCBhZGRyIDlmZmZlYjM3Zjk3ZjFjMDAgYnkgdGFzayBzeXotZXhl
Y3V0b3I3OTgvNTkyMwo+IFsgICAzNi44MjkzMDNdWyBUNTkyM10KPiBbICAgMzYuODI5ODQ2XVsg
VDU5MjNdIENQVTogMCBQSUQ6IDU5MjMgQ29tbTogc3l6LWV4ZWN1dG9yNzk4IE5vdCB0YWludGVk
IDYuMi4wLXN5emthbGxlci0xODMwMi1nNTk2YjZiNzA5NjMyICMwCj4gWyAgIDM2LjgzMjExMF1b
IFQ1OTIzXSBIYXJkd2FyZSBuYW1lOiBHb29nbGUgR29vZ2xlIENvbXB1dGUgRW5naW5lL0dvb2ds
ZSBDb21wdXRlIEVuZ2luZSwgQklPUyBHb29nbGUgMDEvMjEvMjAyMwo+IFsgICAzNi44MzQ0NjRd
WyBUNTkyM10gQ2FsbCB0cmFjZToKPiBbICAgMzYuODM1MTk2XVsgVDU5MjNdICBkdW1wX2JhY2t0
cmFjZSsweDFjOC8weDFmNAo+IFsgICAzNi44MzYyMjldWyBUNTkyM10gIHNob3dfc3RhY2srMHgy
Yy8weDNjCj4gWyAgIDM2LjgzNzEwMF1bIFQ1OTIzXSAgZHVtcF9zdGFja19sdmwrMHhkMC8weDEy
NAo+IFsgICAzNi44MzgxMDNdWyBUNTkyM10gIHByaW50X3JlcG9ydCsweGU0LzB4NGMwCj4gWyAg
IDM2LjgzOTA2OF1bIFQ1OTIzXSAga2FzYW5fcmVwb3J0KzB4ZDQvMHgxMzAKPiBbICAgMzYuODQw
MDUyXVsgVDU5MjNdICBrYXNhbl9jaGVja19yYW5nZSsweDI2NC8weDJhNAo+IFsgICAzNi44NDEx
OTldWyBUNTkyM10gIF9fa2FzYW5fY2hlY2tfd3JpdGUrMHgyYy8weDNjCj4gWyAgIDM2Ljg0MjIx
Nl1bIFQ1OTIzXSAgdjlmc19nZXRfYWNsKzB4MWE0LzB4MzkwCj4gWyAgIDM2Ljg0MzIzMl1bIFQ1
OTIzXSAgdjlmc19tb3VudCsweDc3Yy8weGE1Ywo+IFsgICAzNi44NDQxNjNdWyBUNTkyM10gIGxl
Z2FjeV9nZXRfdHJlZSsweGQ0LzB4MTZjCj4gWyAgIDM2Ljg0NTE3M11bIFQ1OTIzXSAgdmZzX2dl
dF90cmVlKzB4OTAvMHgyNzQKPiBbICAgMzYuODQ2MTM3XVsgVDU5MjNdICBkb19uZXdfbW91bnQr
MHgyNWMvMHg4YzgKPiBbICAgMzYuODQ3MDY2XVsgVDU5MjNdICBwYXRoX21vdW50KzB4NTkwLzB4
ZTU4Cj4gWyAgIDM2Ljg0ODE0N11bIFQ1OTIzXSAgX19hcm02NF9zeXNfbW91bnQrMHg0NWMvMHg1
OTQKPiBbICAgMzYuODQ5MjczXVsgVDU5MjNdICBpbnZva2Vfc3lzY2FsbCsweDk4LzB4MmMwCj4g
WyAgIDM2Ljg1MDQyMV1bIFQ1OTIzXSAgZWwwX3N2Y19jb21tb24rMHgxMzgvMHgyNTgKPiBbICAg
MzYuODUxMzk3XVsgVDU5MjNdICBkb19lbDBfc3ZjKzB4NjQvMHgxOTgKPiBbICAgMzYuODUyMzk4
XVsgVDU5MjNdICBlbDBfc3ZjKzB4NTgvMHgxNjgKPiBbICAgMzYuODUzMjI0XVsgVDU5MjNdICBl
bDB0XzY0X3N5bmNfaGFuZGxlcisweDg0LzB4ZjAKPiBbICAgMzYuODU0MjkzXVsgVDU5MjNdICBl
bDB0XzY0X3N5bmMrMHgxOTAvMHgxOTQKPgo+IENhbGxpbmcgJ19fdjlmc19nZXRfYWNsJyBtZXRo
b2QgaW4gJ3Y5ZnNfZ2V0X2FjbCcgY3JlYXRlcyB0aGUKPiBmb2xsb3dpbmcgY2hhaW4gb2YgZnVu
Y3Rpb24gY2FsbHM6Cj4KPiBfX3Y5ZnNfZ2V0X2FjbAo+ICAgICAgICAgdjlmc19maWRfZ2V0X2Fj
bAo+ICAgICAgICAgICAgICAgICB2OWZzX2ZpZF94YXR0cl9nZXQKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBwOV9jbGllbnRfeGF0dHJ3YWxrCj4KPiBGdW5jdGlvbiBwOV9jbGllbnRfeGF0dHJ3
YWxrIGFjY2VwdHMgYSBwb2ludGVyIHRvIHU2NC10eXBlZAo+IHZhcmlhYmxlIGF0dHJfc2l6ZSBh
bmQgcHV0cyBzb21lIHU2NCB2YWx1ZSBpbnRvIGl0LiBIb3dldmVyLAo+IGFmdGVyIHRoZSBleGVj
dXRpbmcgdGhlIHA5X2NsaWVudF94YXR0cndhbGssIGluIHNvbWUgY2lyY3Vtc3RhbmNlcwo+IHdl
IGFzc2lnbiB0aGUgdmFsdWUgb2YgdTY0LXR5cGVkIHZhcmlhYmxlICdhdHRyX3NpemUnIHRvIHRo
ZQo+IHZhcmlhYmxlICdyZXR2YWwnLCB3aGljaCB3ZSB3aWxsIHJldHVybi4gSG93ZXZlciwgdGhl
IHR5cGUgb2YKPiAncmV0dmFsJyBpcyBzc2l6ZV90LCBhbmQgaWYgdGhlIHZhbHVlIG9mIGF0dHJf
c2l6ZSBpcyBsYXJnZXIKPiB0aGFuIFNTSVpFX01BWCwgd2Ugd2lsbCBmYWNlIHRoZSBzaWduZWQg
dHlwZSBvdmVyZmxvdy4gSWYgdGhlCj4gb3ZlcmZsb3cgb2NjdXJzLCB0aGUgcmVzdWx0IG9mIHY5
ZnNfZmlkX3hhdHRyX2dldCBtYXkgYmUKPiBuZWdhdGl2ZSwgYnV0IG5vdCBjbGFzc2lmaWVkIGFz
IGFuIGVycm9yLiBXaGVuIHdlIHRyeSB0byBhbGxvY2F0ZQo+IGFuIGFjbCB3aXRoICdicm9rZW4n
IHNpemUgd2UgcmVjZWl2ZSBhbiBlcnJvciwgYnV0IGRvbid0IHByb2Nlc3MKPiBpdC4gV2hlbiB3
ZSB0cnkgdG8gZnJlZSB0aGlzIGFjbCwgd2UgZmFjZSB0aGUgJ3dpbGQtbWVtb3J5LWFjY2VzcycK
PiBlcnJvciAoYmVjYXVzZSBpdCB3YXNuJ3QgYWxsb2NhdGVkKS4KPgo+IFRoaXMgcGF0Y2ggd2ls
bCBtb2RpZnkgdGhlIGNvbmRpdGlvbiBpbiB0aGUgJ3Y5ZnNfZmlkX3hhdHRyX2dldCcKPiBmdW5j
dGlvbiwgc28gaXQgd2lsbCByZXR1cm4gYW4gZXJyb3IgaWYgdGhlICdhdHRyX3NpemUnIGlzIGxh
cmdlcgo+IHRoYW4gU1NJWkVfTUFYLgo+Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCtjYjFkMTZmYWNi
M2NjOTBkZTVmYkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gTGluazogaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPWZiYmVmNjZkOWU0ZDA5NjI0MmYzNjE3ZGU1ZDE0ZDEy
NzA1YjQ2NTkKPiBTaWduZWQtb2ZmLWJ5OiBJdmFuIE9ybG92IDxpdmFuLm9ybG92MDMyMkBnbWFp
bC5jb20+Cj4gLS0tCj4gIGZzLzlwL3hhdHRyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzLzlwL3hhdHRy
LmMgYi9mcy85cC94YXR0ci5jCj4gaW5kZXggNTBmN2YzZjZiNTVlLi5kNmY3NDUwMTA3YTggMTAw
NjQ0Cj4gLS0tIGEvZnMvOXAveGF0dHIuYwo+ICsrKyBiL2ZzLzlwL3hhdHRyLmMKPiBAQCAtMzUs
NyArMzUsNyBAQCBzc2l6ZV90IHY5ZnNfZmlkX3hhdHRyX2dldChzdHJ1Y3QgcDlfZmlkICpmaWQs
IGNvbnN0IGNoYXIgKm5hbWUsCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXR2YWw7Cj4gICAg
ICAgICB9Cj4gICAgICAgICBpZiAoYXR0cl9zaXplID4gYnVmZmVyX3NpemUpIHsKPiAtICAgICAg
ICAgICAgICAgaWYgKCFidWZmZXJfc2l6ZSkgLyogcmVxdWVzdCB0byBnZXQgdGhlIGF0dHJfc2l6
ZSAqLwo+ICsgICAgICAgICAgICAgICBpZiAoIWJ1ZmZlcl9zaXplICYmIGF0dHJfc2l6ZSA8PSAo
dTY0KSBTU0laRV9NQVgpIC8qIHJlcXVlc3QgdG8gZ2V0IHRoZSBhdHRyX3NpemUgKi8KCkknbSBu
b3Qgc3VyZSB3aGF0IGFyZSB0aGUgcnVsZXMgYXJvdW5kIGhlcmUgYnV0IEkgcHJlZmVyIHRvIHVz
ZQpicmFja2V0cyBtb3JlIGdlbmVyb3VzbHkuCgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dmFsID0gYXR0cl9zaXplOwo+ICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dmFsID0gLUVSQU5HRTsKPiAtLQo+IDIuMzQuMQo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1rZXJuZWwtbWVu
dGVlcyBtYWlsaW5nIGxpc3QKPiBMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5k
YXRpb24ub3JnCj4gaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgta2VybmVsLW1lbnRlZXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4
LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
