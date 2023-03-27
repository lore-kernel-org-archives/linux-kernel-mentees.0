Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874F2C76195
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Mar 2023 23:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17FD540BB0;
	Mon, 27 Mar 2023 23:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FD540BB0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ai+VJJjg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2O4-qLI42Ocm; Mon, 27 Mar 2023 23:10:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D6863405BD;
	Mon, 27 Mar 2023 23:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6863405BD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92171C007E;
	Mon, 27 Mar 2023 23:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E2DFC007A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 23:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55109405BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 23:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55109405BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLTWEBUB-CG2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 23:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0631840393
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0631840393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 23:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679958649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixSHD7NwErKjXICuazNbf6jL54e0WVDQJqNTVBgzOPw=;
 b=ai+VJJjg57GqGl91CcUuJq8AOl3c8fFRCkGoe5YeuoO/xqQQuyDL2b4bgd7fhA7S3fy8Yp
 HsxkTV5ZzE9vOWoonJ8yQLvNc374cBaTRvL6xfrXzcgpXg5mr5UVHAt1gY3hLzblHXDFzC
 VsJxBiN9ND6cxhjOmZ2smmWj4cd2i14=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-tPI5GMTtP9KCHLypbzhEkA-1; Mon, 27 Mar 2023 19:10:48 -0400
X-MC-Unique: tPI5GMTtP9KCHLypbzhEkA-1
Received: by mail-pl1-f198.google.com with SMTP id
 s4-20020a170902ea0400b001a1f4137086so6591533plg.14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 16:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679958644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixSHD7NwErKjXICuazNbf6jL54e0WVDQJqNTVBgzOPw=;
 b=7ZY85z5eh3Ibn0Q48gxtbKtD5eW5QdTpAV7kJrMoCmNOOavK+kMlQ16TLnoTmmZRch
 L/C5qzuxHgmMHTjaxCUVFmEdDE7pVcdtw+JU4yLUntJ8sOAdniAkcKf7rS8/OS6FeycZ
 f+KmGNFPhJN/SmSLIbRj/v2CPkQOgZ13HfXijyk44I3xW+V4ip6b9vVSytSFnVqqy76I
 fRACnjcGJjE/pPRR/US57PGQAk4XcMrlMZaZ81PrgIVWrJPs08QuCbn7ehnvIsSe8tvL
 gclrgC1tlZNNgdQhrqJpj65BAPAtxtd+DL5m8xL2M3FvWobXFxeSAJYNpz0l0KWk3qC7
 awUg==
X-Gm-Message-State: AAQBX9cVskHlfVWO8TjIB4q0EI3z93JCcu1GILZZPEMygfn8epPjaYFn
 KdUDYXKtLk/0/6y66/NmcpWbAaJssCZ/vsoWjAXI007VkpG4TSofkJCyaXbX2ZLd6fNt4Vjl+W1
 Rgyy4RlLG7LWUmI64eIWmmoNSxRGwW/41gBOsm+h2AEeqHxzuNDy4UWS/sqpnAJQJ
X-Received: by 2002:a05:6a00:2443:b0:627:9d8a:a29c with SMTP id
 d3-20020a056a00244300b006279d8aa29cmr6454300pfj.2.1679958643721; 
 Mon, 27 Mar 2023 16:10:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsZfkbsZqCEpg8AZVEAG7RO+bYQgko0N4B2fTN/mKndVZPWgOB5Qh5G34qucsX7S4vjX3BrZS93kbnPoyL0lc=
X-Received: by 2002:a05:6a00:2443:b0:627:9d8a:a29c with SMTP id
 d3-20020a056a00244300b006279d8aa29cmr6454287pfj.2.1679958643398; Mon, 27 Mar
 2023 16:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
In-Reply-To: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Mar 2023 01:10:31 +0200
Message-ID: <CAHc6FU7b-BaBXrMR3UqbZGF3a_y=20TKkCNde1GvqbmN2-h1xw@mail.gmail.com>
Subject: Re: [PATCH] gfs2 FS: Fix UBSAN array-index-out-of-bounds in
 __gfs2_iomap_get
To: Ivan Orlov <ivan.orlov0322@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-kernel@vger.kernel.org,
 syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, rpeterso@redhat.com,
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

SGVsbG8gSXZhbiwKCk9uIFdlZCwgTWFyIDE1LCAyMDIzIGF0IDEwOjA24oCvQU0gSXZhbiBPcmxv
diA8aXZhbi5vcmxvdjAzMjJAZ21haWwuY29tPiB3cm90ZToKPiBTeXprYWxsZXIgcmVwb3J0ZWQg
dGhlIGZvbGxvd2luZyBpc3N1ZToKPgo+IFVCU0FOOiBhcnJheS1pbmRleC1vdXQtb2YtYm91bmRz
IGluIGZzL2dmczIvYm1hcC5jOjkwMTo0Ngo+IGluZGV4IDExIGlzIG91dCBvZiByYW5nZSBmb3Ig
dHlwZSAndTY0IFsxMV0nCj4gQ1BVOiAwIFBJRDogNTA2NyBDb21tOiBzeXotZXhlY3V0b3IxNjQg
Tm90IHRhaW50ZWQgNi4xLjAtc3l6a2FsbGVyLTEzMDMxLWc3Nzg1NmQ5MTFhOGMgIzAKPiBIYXJk
d2FyZSBuYW1lOiBHb29nbGUgR29vZ2xlIENvbXB1dGUgRW5naW5lL0dvb2dsZSBDb21wdXRlIEVu
Z2luZSwgQklPUyBHb29nbGUgMTAvMjYvMjAyMgo+IENhbGwgVHJhY2U6Cj4gIDxUQVNLPgo+ICBf
X2R1bXBfc3RhY2sgbGliL2R1bXBfc3RhY2suYzo4OCBbaW5saW5lXQo+ICBkdW1wX3N0YWNrX2x2
bCsweDFiMS8weDI5MCBsaWIvZHVtcF9zdGFjay5jOjEwNgo+ICB1YnNhbl9lcGlsb2d1ZSBsaWIv
dWJzYW4uYzoxNTEgW2lubGluZV0KPiAgX191YnNhbl9oYW5kbGVfb3V0X29mX2JvdW5kcysweGUw
LzB4MTEwIGxpYi91YnNhbi5jOjI4Mgo+ICBfX2dmczJfaW9tYXBfZ2V0KzB4NGE0LzB4MTZlMCBm
cy9nZnMyL2JtYXAuYzo5MDEKPiAgZ2ZzMl9pb21hcF9nZXQgZnMvZ2ZzMi9ibWFwLmM6MTM5OSBb
aW5saW5lXQo+ICBnZnMyX2Jsb2NrX21hcCsweDI4Zi8weDdmMCBmcy9nZnMyL2JtYXAuYzoxMjE0
Cj4gIGdmczJfd3JpdGVfYWxsb2NfcmVxdWlyZWQrMHg0NDEvMHg2ZTAgZnMvZ2ZzMi9ibWFwLmM6
MjMyMgo+ICBnZnMyX2pkZXNjX2NoZWNrKzB4MWI5LzB4MjkwIGZzL2dmczIvc3VwZXIuYzoxMTQK
PiAgaW5pdF9qb3VybmFsKzB4NWE0LzB4MjJjMCBmcy9nZnMyL29wc19mc3R5cGUuYzo4MDQKPiAg
aW5pdF9pbm9kZXMrMHhkYy8weDM0MCBmcy9nZnMyL29wc19mc3R5cGUuYzo4ODkKPiAgZ2ZzMl9m
aWxsX3N1cGVyKzB4MWJiMi8weDI3MDAgZnMvZ2ZzMi9vcHNfZnN0eXBlLmM6MTI0Nwo+ICBnZXRf
dHJlZV9iZGV2KzB4NDAwLzB4NjIwIGZzL3N1cGVyLmM6MTI4Mgo+ICBnZnMyX2dldF90cmVlKzB4
NTAvMHgyMTAgZnMvZ2ZzMi9vcHNfZnN0eXBlLmM6MTMzMAo+ICB2ZnNfZ2V0X3RyZWUrMHg4OC8w
eDI3MCBmcy9zdXBlci5jOjE0ODkKPiAgZG9fbmV3X21vdW50KzB4Mjg5LzB4YWQwIGZzL25hbWVz
cGFjZS5jOjMxNDUKPiAgZG9fbW91bnQgZnMvbmFtZXNwYWNlLmM6MzQ4OCBbaW5saW5lXQo+ICBf
X2RvX3N5c19tb3VudCBmcy9uYW1lc3BhY2UuYzozNjk3IFtpbmxpbmVdCj4gIF9fc2Vfc3lzX21v
dW50KzB4MmQzLzB4M2MwIGZzL25hbWVzcGFjZS5jOjM2NzQKPiAgZG9fc3lzY2FsbF94NjQgYXJj
aC94ODYvZW50cnkvY29tbW9uLmM6NTAgW2lubGluZV0KPiAgZG9fc3lzY2FsbF82NCsweDNkLzB4
YjAgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6ODAKPiAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9o
d2ZyYW1lKzB4NjMvMHhjZAo+IFJJUDogMDAzMzoweDdmMmM2MzU2N2FjYQo+IENvZGU6IDgzIGM0
IDA4IDViIDVkIGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGMzIDY2IDJlIDBmIDFm
IDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDQ0IDAwIDAwIDQ5IDg5IGNhIGI4IGE1IDAwIDAwIDAw
IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggYzcgYzEgYzAgZmYgZmYgZmYg
ZjcgZDggNjQgODkgMDEgNDgKPiBSU1A6IDAwMmI6MDAwMDdmZmQwZTNhMjhkOCBFRkxBR1M6IDAw
MDAwMjgyIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMGE1Cj4gUkFYOiBmZmZmZmZmZmZmZmZmZmRh
IFJCWDogMDAwMDAwMDAwMDAwMDAwMyBSQ1g6IDAwMDA3ZjJjNjM1NjdhY2EKPiBSRFg6IDAwMDAw
MDAwMjAwMzdmNDAgUlNJOiAwMDAwMDAwMDIwMDM3ZjgwIFJESTogMDAwMDdmZmQwZTNhMjhlMAo+
IFJCUDogMDAwMDdmZmQwZTNhMjhlMCBSMDg6IDAwMDA3ZmZkMGUzYTI5MjAgUjA5OiAwMDAwMDAw
MDAwMDQzMzUwCj4gUjEwOiAwMDAwMDAwMDAyMDAwMDExIFIxMTogMDAwMDAwMDAwMDAwMDI4MiBS
MTI6IDAwMDAwMDAwMDAwMDAwMDQKPiBSMTM6IDAwMDA1NTU1NTY3MTkyYzAgUjE0OiAwMDAwN2Zm
ZDBlM2EyOTIwIFIxNTogMDAwMDAwMDAwMDAwMDAwMAo+ICA8L1RBU0s+Cj4KPiBUaGlzIGlzc3Vl
IGlzIGNhdXNlZCBieSB0aGUgJ3doaWxlJyBsb29wIGluIHRoZSAnX19nZnMyX2lvbWFwX2dldCcg
ZnVuY3Rpb24sCj4gd2hpY2ggaW5jcmVtZW50cyAnaGVpZ2h0JyB2YXIgdW50aWwgaXQgbWF0Y2hl
cyB0aGUgY29uZGl0aW9uLiBJZiBoZWlnaHQgaXMKPiBsYXJnZXIgb3IgZXF1YWwgdG8gJ3NkcC0+
c2RfaGVpZ2h0c2l6ZScgYXJyYXkgc2l6ZSAod2hpY2ggaXMgR0ZTMl9NQVhfTUVUQV9IRUlHSFQK
PiArIDEpLCB0aGUgYXJyYXktaW5kZXgtb3V0LW9mLWJvdW5kcyBpc3N1ZSBvY2N1cnMuIFRoZXJl
Zm9yZSB3ZSBuZWVkIHRvIGFkZCBleHRyYQo+IGNvbmRpdGlvbiB0byB0aGUgd2hpbGUgbG9vcCwg
d2hpY2ggd2lsbCBwcmV2ZW50IHRoaXMgaXNzdWUuCj4KPiBBZGRpdGlvbmFsbHksIGlmICdoZWln
aHQnIHZhciBhZnRlciB0aGUgd2hpbGUgZW5kaW5nIGlzIGVxdWFsIHRvIEdGUzJfTUFYX01FVEFf
SEVJR0hULAo+IHRoZSAnZmluZF9tZXRhcGF0aCcgY2FsbCByaWdodCBhZnRlciB0aGUgbG9vcCB3
aWxsIGJyZWFrIChiZWNhdXNlIGl0IGFzc3VtZXMgdGhhdAo+ICdoZWlnaHQnIHBhcmFtZXRlciB3
aWxsIG5vdCBiZSBsYXJnZXIgdGhhbiB0aGUgc2l6ZSBvZiBtZXRhcGF0aCdzIG1wX2xpc3QgYXJy
YXkgbGVuZ3RoLAo+IHdoaWNoIGlzIEdGUzJfTUFYX01FVEFfSEVJR0hUKS4gU28sIHdlIG5lZWQg
dG8gY2hlY2sgdGhlICdoZWlnaHQnIGFmdGVyIHRoZSBsb29wIGVuZGluZywKPiBhbmQgaWYgaXRz
IHZhbHVlIGlzIHRvbyBiaWcgd2UgbmVlZCB0byBicmVhayB0aGUgZXhlY3V0aW9uIG9mIHRoZSBm
dW5jdGlvbiwgYW5kIHJldHVybgo+IGEgcHJvcGVyIGVycm9yIGlmIGl0IGlzIHRvbyBiaWcuCgpU
aGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IHRoZSBhY3R1YWwgcHJvYmxlbSBoZXJlIGlzIHRoYXQg
d2UncmUKc3RhcnRpbmcgb3V0IHdpdGggYW4gaW52YWxpZCBoZWlnaHQ7IHdoZW4gc3RhcnRpbmcg
d2l0aCBhIHZhbGlkCmhlaWdodCwgdGhlIGxvb3Agd2lsbCBhbHdheXMgdGVybWluYXRlLiBIZXJl
J3MgYSBwcm9wZXIgZml4OgoKaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJjaGl2ZXMvY2x1
c3Rlci1kZXZlbC8yMDIzLU1hcmNoLzAyMzY0NC5odG1sCgpXaGlsZSBsb29raW5nIGludG8gdGhp
cywgSSBoYWQgZGlmZmljdWx0aWVzIGdldHRpbmcgcHJlcHJvLmMgdG8gd29yay4KVGhlIHJlYXNv
biBpcyB0aGF0IGl0IGFsd2F5cyB1c2VzIC9kZXYvbG9vcDAgaW5zdGVhZCBvZiBjcmVhdGluZyBp
dHMKb3duIGxvb3AgZGV2aWNlLiBIZXJlJ3MgYSBwYXJ0aWFsIGZpeCBmb3IgdGhhdCAoYnV0IG5v
dGUgdGhhdCB0aGlzCmRvZXNuJ3QgaW5jbHVkZSB0aGUgbmVjZXNzYXJ5IGNsZWFudXAgY29kZSBh
dCB0aGUgZW5kKToKCi0tLSBhL3JlcHJvLmMKKysrIGIvcmVwcm8uYwpAQCAtMjYsOCArMjYsNiBA
QAogI2RlZmluZSBfX05SX21lbWZkX2NyZWF0ZSAzMTkKICNlbmRpZgoKLXN0YXRpYyB1bnNpZ25l
ZCBsb25nIGxvbmcgcHJvY2lkOwotCiAvLyUgVGhpcyBjb2RlIGlzIGRlcml2ZWQgZnJvbSBwdWZm
LntjLGh9LCBmb3VuZCBpbiB0aGUgemxpYiBkZXZlbG9wbWVudC4gVGhlCiAvLyUgb3JpZ2luYWwg
ZmlsZXMgY29tZSB3aXRoIHRoZSBmb2xsb3dpbmcgY29weXJpZ2h0IG5vdGljZToKCkBAIC00MjMs
OCArNDIxLDE1IEBAIHN0YXRpYyBsb25nIHN5el9tb3VudF9pbWFnZSh2b2xhdGlsZSBsb25nIGZz
YXJnLAp2b2xhdGlsZSBsb25nIGRpciwKICAgY2hhciogc291cmNlID0gTlVMTDsKICAgY2hhciBs
b29wbmFtZVs2NF07CiAgIGlmIChuZWVkX2xvb3BfZGV2aWNlKSB7CisgICAgaW50IGxvb3BjdGxm
ZDsKKyAgICBsb25nIGRldm5yOworCisgICAgbG9vcGN0bGZkID0gb3BlbigiL2Rldi9sb29wLWNv
bnRyb2wiLCBPX1JEV1IpOworICAgIGRldm5yID0gaW9jdGwobG9vcGN0bGZkLCBMT09QX0NUTF9H
RVRfRlJFRSk7CisgICAgY2xvc2UobG9vcGN0bGZkKTsKKwogICAgIG1lbXNldChsb29wbmFtZSwg
MCwgc2l6ZW9mKGxvb3BuYW1lKSk7Ci0gICAgc25wcmludGYobG9vcG5hbWUsIHNpemVvZihsb29w
bmFtZSksICIvZGV2L2xvb3AlbGx1IiwgcHJvY2lkKTsKKyAgICBzbnByaW50Zihsb29wbmFtZSwg
c2l6ZW9mKGxvb3BuYW1lKSwgIi9kZXYvbG9vcCVsdSIsIGRldm5yKTsKICAgICBpZiAoc2V0dXBf
bG9vcF9kZXZpY2UoZGF0YSwgc2l6ZSwgbG9vcG5hbWUsICZsb29wZmQpID09IC0xKQogICAgICAg
cmV0dXJuIC0xOwogICAgIHNvdXJjZSA9IGxvb3BuYW1lOwoKVGhhbmtzLApBbmRyZWFzCgo+IFRl
c3RlZCB2aWEgc3l6Ym90Lgo+Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCs0NWQ0NjkxYjFlZDNjNDhl
YmEwNUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gTGluazogaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20vYnVnP2lkPTQyMjk2ZWE1NDRjODcwZjRkZGUzYjI1ZWZhNGNjMWI4OTUxNWQz
OGUKPiBTaWduZWQtb2ZmLWJ5OiBJdmFuIE9ybG92IDxpdmFuLm9ybG92MDMyMkBnbWFpbC5jb20+
Cj4gLS0tCj4gIGZzL2dmczIvYm1hcC5jIHwgMTAgKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZ2Zz
Mi9ibWFwLmMgYi9mcy9nZnMyL2JtYXAuYwo+IGluZGV4IGVlZGY2OTI2YzY1Mi4uOWI3MzU4MTY1
Zjk2IDEwMDY0NAo+IC0tLSBhL2ZzL2dmczIvYm1hcC5jCj4gKysrIGIvZnMvZ2ZzMi9ibWFwLmMK
PiBAQCAtODk1LDggKzg5NSwxNiBAQCBzdGF0aWMgaW50IF9fZ2ZzMl9pb21hcF9nZXQoc3RydWN0
IGlub2RlICppbm9kZSwgbG9mZl90IHBvcywgbG9mZl90IGxlbmd0aCwKPiAgICAgICAgIGlvbWFw
LT5sZW5ndGggPSBsZW4gPDwgaW5vZGUtPmlfYmxrYml0czsKPgo+ICAgICAgICAgaGVpZ2h0ID0g
aXAtPmlfaGVpZ2h0Owo+IC0gICAgICAgd2hpbGUgKChsYmxvY2sgKyAxKSAqIHNkcC0+c2Rfc2Iu
c2JfYnNpemUgPiBzZHAtPnNkX2hlaWdodHNpemVbaGVpZ2h0XSkKPiArCj4gKyAgICAgICB3aGls
ZSAoaGVpZ2h0IDw9IEdGUzJfTUFYX01FVEFfSEVJR0hUCj4gKyAgICAgICAgICAgICAgICYmIChs
YmxvY2sgKyAxKSAqIHNkcC0+c2Rfc2Iuc2JfYnNpemUgPiBzZHAtPnNkX2hlaWdodHNpemVbaGVp
Z2h0XSkKPiAgICAgICAgICAgICAgICAgaGVpZ2h0Kys7Cj4gKwo+ICsgICAgICAgaWYgKGhlaWdo
dCA+IEdGUzJfTUFYX01FVEFfSEVJR0hUKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FUkFO
R0U7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gdW5sb2NrOwo+ICsgICAgICAgfQo+ICsKPiAgICAg
ICAgIGZpbmRfbWV0YXBhdGgoc2RwLCBsYmxvY2ssIG1wLCBoZWlnaHQpOwo+ICAgICAgICAgaWYg
KGhlaWdodCA+IGlwLT5pX2hlaWdodCB8fCBnZnMyX2lzX3N0dWZmZWQoaXApKQo+ICAgICAgICAg
ICAgICAgICBnb3RvIGRvX2FsbG9jOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxp
bmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtl
cm5lbC1tZW50ZWVzCg==
