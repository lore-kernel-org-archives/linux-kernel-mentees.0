Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B475EC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 07:29:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D877A2086A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 07:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGZSEeG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D877A2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56C1186BE1;
	Fri, 25 Sep 2020 07:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id up6URYc2owGn; Fri, 25 Sep 2020 07:29:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC70486BCF;
	Fri, 25 Sep 2020 07:29:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2770C0889;
	Fri, 25 Sep 2020 07:29:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2BD9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC18B86BE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmCGGjo2-Ixn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:29:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DF0F186BCF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 07:29:51 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id y5so1435914otg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BjJeEVlB/M1P89lHg5CEGnLQ/YhsD6SFgxzdbSmn4b8=;
 b=EGZSEeG2HQt7sU3IV3NdO84J9sW9vsqSIO+X1O9fgx4UCY1dXWLXXTGAaFC1MTHImi
 jOi0bFt0yxAe5dx4/cC80JjdpkTdKbu81Mc8Oobdeqhvsdq+6U8znMlVZaTwiM6y9csJ
 Drkdrb6VtxvVYlxSM4zNRQ4JZbhUnghAVARmVJPLWrcR85t49dshPv+pLgdEgOjzgyRp
 lpqEathdMAPVeQa9bFaMePHi1AWq/ZYdZeg7DbGPdR/wI8Lo+vhWeUA4Ka1JQaYhQXnb
 7ZiXxRxn6imNo1bUx2h3C/dDiBfiP4Y++m3imSw+X3cYqM0XcJiDgXLuKhrGdQ+mI4qw
 83TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BjJeEVlB/M1P89lHg5CEGnLQ/YhsD6SFgxzdbSmn4b8=;
 b=iiI0rPO03w89RgPjt6fXbQ0hKFEgnjA3gdNPljflhJo7KccF5+q/dR6O6P98CFnbNA
 AJCTExo97r8e1fPYkqjWOtyOvn9+2aBjC0XaRVwRoQetGj3JrwRgE2NbjUX0k8qk5i3B
 uCj9fBuIWjYiHnUqPg5yRYTP9XxiQuAPUEjrm+yDuL81c8NCSimYh5mLtYAdlbO6OjLM
 Xkvdkx46+bQKV37P88ZF0BdqRF9QsSCMBCtzw/2gFvtNKLHfjlC3peMQt37X9z9/lZVD
 QLd5O+oeAIFUYt3N5yU/2PbBtmyOUdtdglgRrn4OTMyUpO36du26iduUle/c/BeYlqHR
 se2A==
X-Gm-Message-State: AOAM532yVNPLdrOTZNc2X4jne3DgF8yBwcqAJTbsIfIxKO/jGCDlXpPw
 rft6xwioQWVKKGBUB3ookbhzWJ2wQ7qBHvqz5p0=
X-Google-Smtp-Source: ABdhPJzGrpbAoj35JVnkwcApOo7Kqvm6iHbVSmYbv45l54w8Pr4Wp6+MZu9QgnF/kGFVqVVzvy5I4by0nMw6hXqDH/c=
X-Received: by 2002:a9d:8f2:: with SMTP id 105mr1913705otf.215.1601018990875; 
 Fri, 25 Sep 2020 00:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
 <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
 <alpine.DEB.2.21.2009211112460.7483@felia>
 <CABJPP5B6D2ttt5D1ROrQNy7BDMcp+CBg6QB3vFRac4H10CkvCw@mail.gmail.com>
 <alpine.DEB.2.21.2009222028250.20644@felia>
 <CABJPP5B9RsGXCCAHxve2hxmCSyPX3C5aO_5MU9QMtNm08cXiNg@mail.gmail.com>
 <alpine.DEB.2.21.2009230925520.6068@felia>
 <CABJPP5CQxXdAD5fFRZaApjh2GJJ_2Dd1Q=6phS-61iLrU5qb9Q@mail.gmail.com>
 <alpine.DEB.2.21.2009230941250.6068@felia>
 <CABJPP5B8GJWPBqeb1RhJknN-4Q0_nQfU9M=Oy+K=Fwe02cgoag@mail.gmail.com>
 <alpine.DEB.2.21.2009250854230.5992@felia>
In-Reply-To: <alpine.DEB.2.21.2009250854230.5992@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 25 Sep 2020 12:59:31 +0530
Message-ID: <CABJPP5Chc5+tNda3af88=pUC2XN8bEga4FiP=+KBwyx0UWOmyA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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

PiBMZXQgdXMgdHJ5IHRvIHB1dCBzb21lIHN5c3RlbWF0aWMgc3RydWN0dXJlIGludG8gdGhpcyBo
YW5kbGluZyBvZiB0aGUKPiBOT19BVVRIT1JfU0lHTl9PRkYuCj4KPiBUaGVyZSBhcmUgYmFzaWNh
bGx5IHR3byBhc3BlY3RzIHRvIGNvbnNpZGVyOgo+Cj4gLSB3aGljaCBjbGFzc2VzIGFyZSBwb3Rl
bnRpYWwgbWlzbWF0Y2hlcyBjYW4gd2UgcG90ZW50aWFsbHkgb2JzZXJ2ZT8KPgo+IC0gd2hpY2gg
bGV2ZWwgb2Ygc2V2ZXJpdHkgZG8gd2UgYXNzaWduIHRvIGVhY2ggY2xhc3Mgb2YgbWlzbWF0Y2g/
Cj4KPiBUbyB0aGUgZmlyc3QgcG9pbnQsIHlvdSBzdGFydGVkIHdpdGggc29tZSBpbml0aWFsIGNs
YXNzZXMgYWJvdmUuCj4KPiAgIDApIHNhbWUgbmFtZSwgc2FtZSBhZGRyZXNzIChubyBtaXNtYXRj
aCkKPiAgIDEpIHNhbWUgbmFtZSwgZGlmZmVyZW50IGFkZHJlc3MKPiAgICAgIHN1YmNsYXNzZXM6
IChob3cgJ2RpZmZlcmVudCcgYWRkcmVzcz8pCj4gICAgICAtIGVtYWlsIGFkZHJlc3MgZGlmZmVy
IGJ5IHZhbGlkIGRpZmZlcmVuY2UsIGUuZy4sIGV4dGVuc2lvbnMgdGhhdAo+ICAgICAgICB3aWxs
IGdvIHRvIHRoZSBzYW1lIGluYm94LCBlLmcuLCAgdGhlIHh5eitmZHMgZXh0ZW5zaW9uIGluIG1h
aWwKPiAgICAgICAgYWRkcmVzc2VzLiAodGhhdCBpcyB5b3VyIGNsYXNzIDMsIHJpZ2h0PykKPiAg
ICAgIC0gdHdvIGVtYWlsIGFkZHJlc3NlcyB0aGF0IGFyZSBrbm93biB0byBiZWxvbmcgdG8gdGhl
IHNhbWUgaW5kaXZpZHVhbAo+ICAgICAgICAtIGtub3duIGJlY2F1c2Ugb2YgLm1haWxtYXAKPiAg
ICAgICAgLSBrbm93biBvdGhlcndpc2U/Cj4gICAyKSBkaWZmZXJlbnQgbmFtZSwgc2FtZSBhZGRy
ZXNzCj4gICAgICBzdWJjbGFzc2VzOiAoaG93ICdkaWZmZXJlbnQnIG5hbWU/KQo+ICAgICAgLSBl
eGFtcGxlczoKPiAgICAgICAgLSBGaXJzdG5hbWUsIExhc3RuYW1lIChidXQgbWlkZGxlLW5hbWUg
aW5pdGlhbHMgZGlmZmVyKQo+ICAgICAgICAtIHNwZWNpYWwgInJlZ2lvbmFsIiBjaGFyYWN0ZXJz
LCBsaWtlIMO8IHZzLiB1ZSwgZXRjLgo+ICAgICAgICAtIGZpcnN0bmFtZSBhbmQgbGFzdG5hbWUg
YXJlIHJldmVydGVkIGV0Yy4KPiAgIDMpIGRpZmZlcmVudCBuYW1lLCBkaWZmZXJlbnQgYWRkcmVz
cyAoYnV0IHN0aWxsIHdlIGJlbGlldmUgaXQgIm1hdGNoZXMiKQo+ICAgICAgY29tYmluYXRpb25z
IG9mIHN1YmNsYXNzZXMgb2YgMSkgYW5kIDIpLCB3aGljaCB3ZSB3YW50IHRvIGNvbnNpZGVyLgo+
Cj4gVGhlbiwgdG8gdGhlIHNlY29uZCBxdWVzdGlvbjoKPgo+IFNvLCB0aGVzZSBkaWZmZXJlbnQg
Y2xhc3NlcyB3ZSBjYW4gdGhpbmsgb2YgYW5kICJhc3NpZ24iIGRpZmZlcmVudAo+IHNldmVyaXRp
ZXMgdGhhdCBjaGVja3BhdGNoLnBsIGNhbiB1c2UuCj4KPiBDaGVja3BhdGNoLnBsIGFscmVhZHkg
aGFzIGZvdXIgbGV2ZWxzOgo+Cj4gdGhyZWUgc2V2ZXJpdHkgcmVwb3J0aW5nIGxldmVsczogRVJS
T1IsIFdBUk4sIENIRUNLLCBhbmQKPiB0aGUgbGV2ZWwgX2RvIG5vdCByZXBvcnRfICh3aGljaCBp
cyBpbXBsZW1lbnRlZCBieSBqdXN0IGlnbm9yaW5nIHNvbWUga2luZAo+IG9mIGRpZmZlcmVuY2Up
Lgo+Cj4gSSB0aGluayBhIGxvdCBvZiBkaXNjdXNzaW9uIHdpbGwgYmUgYXJvdW5kIHdoYXQgc2V2
ZXJpdHkgdG8gYXNzaWduIHRvCj4gd2hpY2ggY2xhc3MgYWJvdmUsIGFuZCBpbiBzb21lIHdheSwg
bG9uZy10ZXJtIG1haW50YWluZXJzIGhhdmUgYSBsYXJnZXIKPiBzYXkgdGhhbiB3ZSBkbyBoZXJl
Lgo+Cj4gU28sIGxldCB1cyBmaXJzdCBtb2RpZnkgY2hlY2twYXRjaC5wbCB0byBpZGVudGlmeSB0
aGUgdmFyaW91cyBjbGFzc2VzCj4gYWJvdmUsIG1heWJlIGp1c3Qgc3RhcnRpbmcgdmVyeSBiYXNp
Yywgd2l0aCBkaWZmZXJlbnQgbmFtZSwgc2FtZSBhZGRyZXNzCj4gYW5kIHNhbWUgbmFtZSwgZGlm
ZmVyZW50IGFkZHJlc3MgYW5kIHJ1biBpdCBvdmVyIHRoZSBjb21taXQgcmFuZ2UgYW5kIHNlZQo+
IHdoaWNoIGV4YW1wbGVzIHNob3cgdXAgYW5kIGhvdyBvZnRlbi4KPgo+IEZvciBub3csIHdlIGZp
cnN0IGp1c3QgdXNlIGNoZWNrcGF0Y2gucGwgdG8gaWRlbnRpZnkgdGhlIGRpZmZlcmVudCB0eXBl
cwo+IGFuZCByZWZpbmUgdGhlbSBpbnRvIHN1YmNsYXNzZXM7IHRoZW4sIHdlIGNhbiBkaXNjdXNz
IHdpdGggc2V2ZXJpdHkgc2hvdWxkCj4gYmUgYXNzaWduZWQgdG8gd2hpY2ggdHlwZSBvZiBtaXNt
YXRjaC4KPgo+IFRoZSBzZWNvbmQgcXVlc3Rpb24gc2hvdWxkIG5vdCBpbnZhbGlkYXRlIG91ciBk
YXRhIGNvbGxlY3Rpb24gYW5kCj4gaWRlbnRpZmljYXRpb24gb2Ygc3ViY2xhc3NlcywgdGhvdWdo
Lgo+Cj4gRG9lcyB0aGF0IGhlbHA/IFdoYXQgZG8geW91IHRoaW5rPwo+Cj4KPiBMdWthcwoKWWVz
LCB0aGF0IHNob3VsZCBoZWxwIEkgdGhpbmsuIEN1cnJlbnRseSBjaGVja3BhdGNoIGlzIHZlcnkg
dmFndWUKYWJvdXQgQXV0aG9yIHNpZ24gb2Zmcywgc28gc3ViY2xhc3NpbmcgaXQgd2lsbCByZWFs
bHkgYmUgaGVscGZ1bC4KQnV0IGF0IHRoZSBzYW1lIHBvaW50IEkgZG9uJ3QgdGhpbmsgaXQgc2hv
dWxkIGJlY29tZQp0b28gY29tcGxleCBlaXRoZXIuCgpJIGhhdmUgYWxyZWFkeSBwcmVwYXJlZCBh
IHBhdGNoIGZvciB0aGUgYmFzaWMgdHdvIGNsYXNzZXM6CjEpIHNhbWUgbmFtZSwgZGlmZmVyZW50
IGFkZHJlc3MKMikgc2FtZSBhZGRyZXNzLCBkaWZmZXJlbnQgbmFtZQoKSXQgd291bGQgYmUgZ3Jl
YXQgdG8gaGF2ZSB5b3VyIGZlZWRiYWNrIG9uIHRoaXMuCgotLS0KZGlmZiAtLWdpdCBhL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbAppbmRleCA5ZTY1ZDIxNDU2
ZjEuLmUyM2U3NTNmY2FmMCAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsCisrKyBi
L3NjcmlwdHMvY2hlY2twYXRjaC5wbApAQCAtMTIxMCwxNCArMTIxMCwyMiBAQCBzdWIgcmVmb3Jt
YXRfZW1haWwgewogIHJldHVybiBmb3JtYXRfZW1haWwoJGVtYWlsX25hbWUsICRlbWFpbF9hZGRy
ZXNzKTsKIH0KCi1zdWIgc2FtZV9lbWFpbF9hZGRyZXNzZXMgeworc3ViIHNhbWVfbWFpbF9jaGVj
ayB7CiAgbXkgKCRlbWFpbDEsICRlbWFpbDIpID0gQF87CgogIG15ICgkZW1haWwxX25hbWUsICRu
YW1lMV9jb21tZW50LCAkZW1haWwxX2FkZHJlc3MsICRjb21tZW50MSkgPQpwYXJzZV9lbWFpbCgk
ZW1haWwxKTsKICBteSAoJGVtYWlsMl9uYW1lLCAkbmFtZTJfY29tbWVudCwgJGVtYWlsMl9hZGRy
ZXNzLCAkY29tbWVudDIpID0KcGFyc2VfZW1haWwoJGVtYWlsMik7CgotIHJldHVybiAkZW1haWwx
X25hbWUgZXEgJGVtYWlsMl9uYW1lICYmCi0gICAgICAgICRlbWFpbDFfYWRkcmVzcyBlcSAkZW1h
aWwyX2FkZHJlc3M7CisgbXkgJHNhbWVfbmFtZSA9ICRlbWFpbDFfbmFtZSBlcSAkZW1haWwyX25h
bWU7CisgbXkgJHNhbWVfYWRkcmVzcz0gJGVtYWlsMV9hZGRyZXNzIGVxICRlbWFpbDJfYWRkcmVz
czsKKworIHJldHVybiAoJHNhbWVfbmFtZSwgJHNhbWVfYWRkcmVzcyk7Cit9CisKK3N1YiBzYW1l
X2VtYWlsX2FkZHJlc3NlcyB7CisgbXkgKCRzYW1lX25hbWUsICRzYW1lX2FkZHJlc3MpID0gc2Ft
ZV9tYWlsX2NoZWNrKEBfKTsKKworIHJldHVybiAkc2FtZV9uYW1lICYmICRzYW1lX2FkZHJlc3M7
CiB9Cgogc3ViIHdoaWNoIHsKQEAgLTIzNDcsNiArMjM1NSw3IEBAIHN1YiBwcm9jZXNzIHsKICBt
eSAkc2lnbm9mZiA9IDA7CiAgbXkgJGF1dGhvciA9ICcnOwogIG15ICRhdXRob3JzaWdub2ZmID0g
MDsKKyBteSAkYXV0aG9yc2lnbmVyciA9ICcnOwogIG15ICRpc19wYXRjaCA9IDA7CiAgbXkgJGlz
X2JpbmRpbmdfcGF0Y2ggPSAtMTsKICBteSAkaW5faGVhZGVyX2xpbmVzID0gJGZpbGUgPyAwIDog
MTsKQEAgLTI2NzcsNiArMjY4NiwxMyBAQCBzdWIgcHJvY2VzcyB7CiAgaWYgKCRhdXRob3IgbmUg
JycpIHsKICBpZiAoc2FtZV9lbWFpbF9hZGRyZXNzZXMoJDEsICRhdXRob3IpKSB7CiAgJGF1dGhv
cnNpZ25vZmYgPSAxOworIH0gZWxzZSB7CisgbXkgKCRzYW1lX25hbWUsICRzYW1lX2FkZHJlc3Mp
ID0gc2FtZV9tYWlsX2NoZWNrKCQxLCAkYXV0aG9yKTsKKyBpZigkc2FtZV9uYW1lKSB7CisgJGF1
dGhvcnNpZ25lcnIgPSAiQUREUkVTU19NSVNNQVRDSDokezF9IjsKKyB9IGVsc2lmICgkc2FtZV9h
ZGRyZXNzKSB7CisgJGF1dGhvcnNpZ25lcnIgPSAiTkFNRV9NSVNNQVRDSDokezF9IjsKKyB9CiAg
fQogIH0KICB9CkBAIC02ODkxLDggKzY5MDcsMTYgQEAgc3ViIHByb2Nlc3MgewogIEVSUk9SKCJN
SVNTSU5HX1NJR05fT0ZGIiwKICAgICAgICAiTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMp
XG4iKTsKICB9IGVsc2lmICghJGF1dGhvcnNpZ25vZmYpIHsKLSBXQVJOKCJOT19BVVRIT1JfU0lH
Tl9PRkYiLAotICAgICAgIk1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZSBieSBub21pbmFsIHBh
dGNoIGF1dGhvciAnJGF1dGhvcidcbiIpOworIGlmKCRhdXRob3JzaWduZXJyID1+IC9eTkFNRV9N
SVNNQVRDSDooLiopLykgeworIFdBUk4oIk5PX0FVVEhPUl9TSUdOX09GRiIsCisgICAgICAiQXV0
aG9yIG5hbWUgbWlzbWF0Y2g6ICdGcm9tOiAkYXV0aG9yJyAhPSAnU2lnbmVkLW9mZi1ieTogJDEn
XG4iKTsKKyB9IGVsc2lmICgkYXV0aG9yc2lnbmVyciA9fiAvXkFERFJFU1NfTUlTTUFUQ0g6KC4q
KS8pIHsKKyBXQVJOKCJOT19BVVRIT1JfU0lHTl9PRkYiLAorICAgICAgIkF1dGhvciBlbWFpbCBh
ZGRyZXNzIG1pc21hdGNoOiAnRnJvbTogJGF1dGhvcicgIT0KJ1NpZ25lZC1vZmYtYnk6ICQxJ1xu
Iik7CisgfSBlbHNlIHsKKyBXQVJOKCJOT19BVVRIT1JfU0lHTl9PRkYiLAorICJNaXNzaW5nIFNp
Z25lZC1vZmYtYnk6IGxpbmUgYnkgbm9taW5hbCBwYXRjaCBhdXRob3IgJyRhdXRob3InXG4iKTsK
KyB9CiAgfQogIH0KLS0tCgpUaGFua3MsCkR3YWlwYXlhbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
