Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E23C00528
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 18:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A0480C98;
	Tue,  1 Aug 2023 18:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A0480C98
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=eDW9Y051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Cg_ltxRi6Xb; Tue,  1 Aug 2023 18:48:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 24A9B80C3D;
	Tue,  1 Aug 2023 18:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A9B80C3D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7348C0071;
	Tue,  1 Aug 2023 18:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B152C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56B8840334
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B8840334
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=eDW9Y051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNRLZHz5Lv-C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:07 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E1F940077
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 18:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E1F940077
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bcac140aaaso1515759a34.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Aug 2023 11:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690915686; x=1691520486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMzrdvdGDVBVT8pKCxDX3mfn16DbA30Sg2kYaNxaO7g=;
 b=eDW9Y051GNtyW9xCds03eye8SPMwHFznbthZMc0sMB4VcHGWdkb7mDPJStkIS3yi5o
 aVNMWsqdsMwcY3o/XYuBsj8ExEUvxmKAmRDTT2rhlNy4rd6S56DoSJA0mfCWFgjfDlAP
 /2Ot7kf55JxYCSLrjiSxl2qRGamIIsbiPz2anP39Hi2ld0va8d53svdrbqVZAe/ORwhX
 vk37sqVdbjnb27Rcs8xb5ZIl3cMKHF/NDon4v3y4XxuMlMoMAmcMg8pk5b16wszfLtuK
 6esmVf5nPv/0OOUdfikIyObOGff7RFuXysrH39aLGts5xQJg94xdQfQ6ZjFB8CaLwJMr
 zWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690915686; x=1691520486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMzrdvdGDVBVT8pKCxDX3mfn16DbA30Sg2kYaNxaO7g=;
 b=Fr0B0tGCX0enOl+cP6XZXpNTNo9ePM8hWyPpmU3ja2w6HF+9hova8daz6XokJQOcX0
 VNQMBsXIssLMcmFgWSuy17bdABu7QoBpeMAdsGhbc5wGv+PkWvhcJ4MwY800CUP/IB1E
 cyAPoTH23yW7xo5LEDEB0DSSkefPwe1u+7TSNilNUbcolW0NDwa0RB4+BwLUUADWtxqp
 VXrM0Rye3ncmn0xpGM6URM2z077f0mnGUXN7C9PJaWqxHZtNYwGHmmm63IbaMatEEkNS
 kfFHmiRq7Y1LAXNyrYxtztnchcsEze9lyfPKlfGA4qjCt8kB6eUljspx4t/e4L5cadOQ
 9s4A==
X-Gm-Message-State: ABy/qLYulrLERd6Cs3AWIHDFjQsjMxHqdF0xVqrweawwdIr97YsxBkOL
 Z0+yUPno8u3+BV59pZE1TWvgi70yFaHjEKXmscHcyw==
X-Google-Smtp-Source: APBJJlG+Abqdzww+d0y6okscA3laf/TFZ18QCcEuBV7TMn7e7xrhA8kWZD4Qb4hQuqzZUBRh1XpmOw19AOxzsC1IwXE=
X-Received: by 2002:a05:6870:c081:b0:1be:c2c5:a1d2 with SMTP id
 c1-20020a056870c08100b001bec2c5a1d2mr10387924oad.59.1690915685976; Tue, 01
 Aug 2023 11:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230730131750.16552-1-tuananhlfc@gmail.com>
 <CAKH8qBtNaEW4pEj7Y1WiLoPk2aMPoq3AuO14D=OF_NCN255awQ@mail.gmail.com>
 <34890307-ca7a-ffa8-321d-eb5ad0db4a5a@gmail.com>
In-Reply-To: <34890307-ca7a-ffa8-321d-eb5ad0db4a5a@gmail.com>
Date: Tue, 1 Aug 2023 11:47:54 -0700
Message-ID: <CAKH8qBsy+PaFzCX7jNzHSWwFcKT5yEGyTihd6iwhOK1HPy5HeA@mail.gmail.com>
Subject: Re: [PATCH v3] samples/bpf: Fix build out of source tree
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel@iogearbox.net, martin.lau@linux.dev, ast@kernel.org,
 andrii@kernel.org, bpf@vger.kernel.org,
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
From: Stanislav Fomichev via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVHVlLCBBdWcgMSwgMjAyMyBhdCA4OjU24oCvQU0gQW5oIFR1YW4gUGhhbiA8dHVhbmFuaGxm
Y0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDAxLzA4LzIwMjMgMDA6MTcsIFN0YW5pc2xh
diBGb21pY2hldiB3cm90ZToKPiA+IE9uIFN1biwgSnVsIDMwLCAyMDIzIGF0IDY6MTjigK9BTSBB
bmggVHVhbiBQaGFuIDx0dWFuYW5obGZjQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBUaGlz
IGNvbW1pdCBmaXhlcyBhIGZldyBjb21waWxhdGlvbiBpc3N1ZXMgd2hlbiBidWlsZGluZyBvdXQg
b2Ygc291cmNlCj4gPj4gdHJlZS4gVGhlIGNvbW1hbmQgdGhhdCBJIHVzZWQgdG8gYnVpbGQgc2Ft
cGxlcy9icGY6Cj4gPj4KPiA+PiBleHBvcnQgS0JVSUxEX09VVFBVVD0vdG1wCj4gPj4gbWFrZSBW
PTEgTT1zYW1wbGVzL2JwZgo+ID4+Cj4gPj4gVGhlIGNvbXBpbGF0aW9uIGZhaWxlZCBzaW5jZSBp
dCB0cmllZCB0byBmaW5kIHRoZSBoZWFkZXIgZmlsZXMgaW4gdGhlCj4gPj4gd3JvbmcgcGxhY2Vz
IGJldHdlZW4gb3V0cHV0IGRpcmVjdG9yeSBhbmQgc291cmNlIHRyZWUgZGlyZWN0b3J5Cj4gPgo+
ID4gU3RpbGwgZG9lc24ndCBhcHBseSBjbGVhbmx5LCBtb3N0IGxpa2VseSBkdWUgdG8gY29tbWl0
IGJiYWYxZmYwNmFmNAo+ID4gKCJicGY6IFJlcGxhY2UgZGVwcmVjYXRlZCAtdGFyZ2V0IHdpdGgg
LS10YXJnZXQ9IGZvciBDbGFuZyIpLgo+ID4gUGxlYXNlIHJlYmFzZSBhbmQgcmVwb3N0LiBBbHNv
IGFkZCBbUEFUQ0ggYnBmLW5leHQgdjRdIHRhZy4KPiA+Cj4KPiBJIHJlYmFzZWQgdGhlIGNvbW1p
dCBmcm9tIGJwZiB0cmVlIHNvIGl0J3MgdGhlIHJlYXNvbiBmb3IgeW91ciBmYWlsZWQKPiBhcHBs
aWVkLiBIYXZlIHJlYmFzZWQgZnJvbSBicGYtbmV4dCB0cmVlIGFuZCBzZW50IGEgIlBBVENIIGJw
Zi1uZXh0IHY0Igo+IHBhdGNoLgoKWWVhaCwgbm90IHN1cmUgaXQgc2hvdWxkIGdvIHZpYSBicGYg
dHJlZS4gV2UgZG9uJ3QgaGF2ZSBhIGdvb2QgRml4ZXMKdGFnIGFuZCBpdCdzIGFib3V0IHNhbXBs
ZXMsIHNvIGxldCdzIGtlZXAgYnBmLW5leHQuIFRoeCEKCj4gVGhhbmsgeW91IQo+Cj4gPgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEFuaCBUdWFuIFBoYW4gPHR1YW5hbmhsZmNAZ21haWwuY29tPgo+ID4+
IC0tLQo+ID4+IENoYW5nZXMgZnJvbSB2MToKPiA+PiAtIFVuY29uZGl0aW9uYWxseSBhZGQgIi1J
ICQob2JqdHJlZSkvJChvYmopIiB0byBfdHByb2djX2ZsYWdzIGFuZCBkcm9wIHVubmVjZXNzYXJ5
IHBhcnQKPiA+PiBSZWZlcmVuY2U6Cj4gPj4gLSB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzY3YmVjNmE5LWFmNTktZDZmOS0yNjMwLTE3MjgwNDc5YTFmN0BnbWFpbC5jb20vCj4gPj4g
LSB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzJiYTFjMDc2LWY1YmYtNDMyZi01MGMx
LTcyYzg0NTQwMzE2N0BnbWFpbC5jb20vCj4gPj4gLS0tCj4gPj4gICBzYW1wbGVzL2JwZi9NYWtl
ZmlsZSAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gPj4gICBzYW1wbGVzL2JwZi9NYWtlZmlsZS50
YXJnZXQgfCAgOSArLS0tLS0tLS0KPiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9zYW1wbGVzL2JwZi9N
YWtlZmlsZSBiL3NhbXBsZXMvYnBmL01ha2VmaWxlCj4gPj4gaW5kZXggNjE1ZjI0ZWJjNDljLi5j
ZmM5NjBiMzcxM2EgMTAwNjQ0Cj4gPj4gLS0tIGEvc2FtcGxlcy9icGYvTWFrZWZpbGUKPiA+PiAr
KysgYi9zYW1wbGVzL2JwZi9NYWtlZmlsZQo+ID4+IEBAIC0zNDEsMTAgKzM0MSwxMCBAQCAkKG9i
aikvaGJtX2VkdF9rZXJuLm86ICQoc3JjKS9oYm0uaCAkKHNyYykvaGJtX2tlcm4uaAo+ID4+ICAg
IyBPdmVycmlkZSBpbmNsdWRlcyBmb3IgeGRwX3NhbXBsZV91c2VyLm8gYmVjYXVzZSAkKHNyY3Ry
ZWUpL3Vzci9pbmNsdWRlIGluCj4gPj4gICAjIFRQUk9HU19DRkxBR1MgY2F1c2VzIGNvbmZsaWN0
cwo+ID4+ICAgWERQX1NBTVBMRV9DRkxBR1MgKz0gLVdhbGwgLU8yIFwKPiA+PiAtICAgICAgICAg
ICAgICAgICAgICAtSSQoc3JjKS8uLi8uLi90b29scy9pbmNsdWRlIFwKPiA+PiAtICAgICAgICAg
ICAgICAgICAgICAtSSQoc3JjKS8uLi8uLi90b29scy9pbmNsdWRlL3VhcGkgXAo+ID4+ICsgICAg
ICAgICAgICAgICAgICAgIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlIFwKPiA+PiArICAgICAg
ICAgICAgICAgICAgICAtSSQoc3JjdHJlZSkvdG9vbHMvaW5jbHVkZS91YXBpIFwKPiA+PiAgICAg
ICAgICAgICAgICAgICAgICAgLUkkKExJQkJQRl9JTkNMVURFKSBcCj4gPj4gLSAgICAgICAgICAg
ICAgICAgICAgLUkkKHNyYykvLi4vLi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmCj4gPj4g
KyAgICAgICAgICAgICAgICAgICAgLUkkKHNyY3RyZWUpL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZgo+ID4+Cj4gPj4gICAkKG9iaikvJChYRFBfU0FNUExFKTogVFBST0dTX0NGTEFHUyA9ICQo
WERQX1NBTVBMRV9DRkxBR1MpCj4gPj4gICAkKG9iaikvJChYRFBfU0FNUExFKTogJChzcmMpL3hk
cF9zYW1wbGVfdXNlci5oICQoc3JjKS94ZHBfc2FtcGxlX3NoYXJlZC5oCj4gPj4gQEAgLTM5Myw3
ICszOTMsNyBAQCAkKG9iaikveGRwX3JvdXRlcl9pcHY0LmJwZi5vOiAkKG9iaikveGRwX3NhbXBs
ZS5icGYubwo+ID4+ICAgJChvYmopLyUuYnBmLm86ICQoc3JjKS8lLmJwZi5jICQob2JqKS92bWxp
bnV4LmggJChzcmMpL3hkcF9zYW1wbGUuYnBmLmggJChzcmMpL3hkcF9zYW1wbGVfc2hhcmVkLmgK
PiA+PiAgICAgICAgICBAZWNobyAiICBDTEFORy1CUEYgIiAkQAo+ID4+ICAgICAgICAgICQoUSkk
KENMQU5HKSAtZyAtTzIgLXRhcmdldCBicGYgLURfX1RBUkdFVF9BUkNIXyQoU1JDQVJDSCkgXAo+
ID4+IC0gICAgICAgICAgICAgICAtV25vLWNvbXBhcmUtZGlzdGluY3QtcG9pbnRlci10eXBlcyAt
SSQoc3JjdHJlZSkvaW5jbHVkZSBcCj4gPj4gKyAgICAgICAgICAgICAgIC1Xbm8tY29tcGFyZS1k
aXN0aW5jdC1wb2ludGVyLXR5cGVzIC1JJChvYmopIC1JJChzcmN0cmVlKS9pbmNsdWRlIFwKPiA+
PiAgICAgICAgICAgICAgICAgIC1JJChzcmN0cmVlKS9zYW1wbGVzL2JwZiAtSSQoc3JjdHJlZSkv
dG9vbHMvaW5jbHVkZSBcCj4gPj4gICAgICAgICAgICAgICAgICAtSSQoTElCQlBGX0lOQ0xVREUp
ICQoQ0xBTkdfU1lTX0lOQ0xVREVTKSBcCj4gPj4gICAgICAgICAgICAgICAgICAtYyAkKGZpbHRl
ciAlLmJwZi5jLCReKSAtbyAkQAo+ID4+IEBAIC00MTIsNyArNDEyLDcgQEAgeGRwX3JvdXRlcl9p
cHY0LnNrZWwuaC1kZXBzIDo9IHhkcF9yb3V0ZXJfaXB2NC5icGYubyB4ZHBfc2FtcGxlLmJwZi5v
Cj4gPj4KPiA+PiAgIExJTktFRF9CUEZfU1JDUyA6PSAkKHBhdHN1YnN0ICUuYnBmLm8sJS5icGYu
YywkKGZvcmVhY2ggc2tlbCwkKExJTktFRF9TS0VMUyksJCgkKHNrZWwpLWRlcHMpKSkKPiA+Pgo+
ID4+IC1CUEZfU1JDU19MSU5LRUQgOj0gJChub3RkaXIgJCh3aWxkY2FyZCAkKHNyYykvKi5icGYu
YykpCj4gPj4gK0JQRl9TUkNTX0xJTktFRCA6PSAkKG5vdGRpciAkKHdpbGRjYXJkICQoc3JjdHJl
ZSkvJChzcmMpLyouYnBmLmMpKQo+ID4+ICAgQlBGX09CSlNfTElOS0VEIDo9ICQocGF0c3Vic3Qg
JS5icGYuYywkKG9iaikvJS5icGYubywgJChCUEZfU1JDU19MSU5LRUQpKQo+ID4+ICAgQlBGX1NL
RUxTX0xJTktFRCA6PSAkKGFkZHByZWZpeCAkKG9iaikvLCQoTElOS0VEX1NLRUxTKSkKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9zYW1wbGVzL2JwZi9NYWtlZmlsZS50YXJnZXQgYi9zYW1wbGVzL2Jw
Zi9NYWtlZmlsZS50YXJnZXQKPiA+PiBpbmRleCA3NjIxZjU1ZTI5NDcuLmQyZmFiOTU5NjUyZSAx
MDA2NDQKPiA+PiAtLS0gYS9zYW1wbGVzL2JwZi9NYWtlZmlsZS50YXJnZXQKPiA+PiArKysgYi9z
YW1wbGVzL2JwZi9NYWtlZmlsZS50YXJnZXQKPiA+PiBAQCAtMzgsMTQgKzM4LDcgQEAgdHByb2ct
Y29ianMgIDo9ICQoYWRkcHJlZml4ICQob2JqKS8sJCh0cHJvZy1jb2JqcykpCj4gPj4gICAjIEhh
bmRsZSBvcHRpb25zIHRvIGdjYy4gU3VwcG9ydCBidWlsZGluZyB3aXRoIHNlcGFyYXRlIG91dHB1
dCBkaXJlY3RvcnkKPiA+Pgo+ID4+ICAgX3Rwcm9nY19mbGFncyAgID0gJChUUFJPR1NfQ0ZMQUdT
KSBcCj4gPj4gLSAgICAgICAgICAgICAgICAgJChUUFJPR0NGTEFHU18kKGJhc2V0YXJnZXQpLm8p
Cj4gPj4gLQo+ID4+IC0jICQob2JqdHJlZSkvJChvYmopIGZvciBpbmNsdWRpbmcgZ2VuZXJhdGVk
IGhlYWRlcnMgZnJvbSBjaGVja2luIHNvdXJjZSBmaWxlcwo+ID4+IC1pZmVxICgkKEtCVUlMRF9F
WFRNT0QpLCkKPiA+PiAtaWZkZWYgYnVpbGRpbmdfb3V0X29mX3NyY3RyZWUKPiA+PiAtX3Rwcm9n
Y19mbGFncyAgICs9IC1JICQob2JqdHJlZSkvJChvYmopCj4gPj4gLWVuZGlmCj4gPj4gLWVuZGlm
Cj4gPj4gKyAgICAgICAgICAgICAgICAgLUkgJChvYmp0cmVlKS8kKG9iaikKPiA+Pgo+ID4+ICAg
dHByb2djX2ZsYWdzICAgID0gLVdwLC1NRCwkKGRlcGZpbGUpICQoX3Rwcm9nY19mbGFncykKPiA+
Pgo+ID4+IC0tCj4gPj4gMi4zNC4xCj4gPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4
LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
