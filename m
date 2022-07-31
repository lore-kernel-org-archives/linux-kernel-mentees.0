Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B616C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 Jul 2022 18:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD5B61066;
	Sun, 31 Jul 2022 18:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD5B61066
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=GGC6NTSC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anVVGF2Ibyy7; Sun, 31 Jul 2022 18:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8F2C160E25;
	Sun, 31 Jul 2022 18:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F2C160E25
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D0D9C0032;
	Sun, 31 Jul 2022 18:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77035C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43B1840614
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B1840614
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=GGC6NTSC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGAGnEFeGQpp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:47:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77334400E2
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77334400E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659293214; cv=none; d=zohomail.in; s=zohoarc; 
 b=VMtZTlZqTpIyiVgpkxvDTwe/5hDJ5qiZzIN+CYThyu+b1oOBOMk+xvSBiB7SY/inhuFbMnx156X/Er9T8DTWf+AKvQwLC5GYo+gRSiF+AwNrI5KDHcAHJXYn9lS5PX18k9g3COaEmxLj8bvMJ0V3dnd64gLOUz0QRB26XVo7zpk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659293214;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Uj4glfeT9Z7nH5oo3H/JP4uyo13D+BpPuLlcPeEcVE0=; 
 b=cbFVMWjHuh+2Tbvv+yheSdv8Rsv4rCdwAUpwnXajeTpSVXcmZPKY6d5bC6yPXFaWCkqfF1QXem9bTZF2qhp417JRgIgHqHQ2PwERbmapIY0J4go9lS5PyOj9/cG2VIPk8fVk3ze0GgFxhEbEA1jL+NkV7zdhF/wW0ozu5UwukzM=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659293214; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Uj4glfeT9Z7nH5oo3H/JP4uyo13D+BpPuLlcPeEcVE0=;
 b=GGC6NTSC74sqGG+ekDg5O9aXSNSdgGaBexWLPVoO1uzC5640kYibHqavkoUyeBM/
 rQvW3e7LueMbBxio0QfREfJW3AjnDLqD3//LQ3p5o+/w463Lmsleam1dQxN01R+5IYO
 frk8Rf34MWUGr/KplwnIA7j9c5s8qXmSg2GrlC6A=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659293203918386.25370840011624;
 Mon, 1 Aug 2022 00:16:43 +0530 (IST)
Date: Mon, 01 Aug 2022 00:16:43 +0530
To: "Dipanjan Das" <mail.dipanjan.das@gmail.com>
Message-ID: <1825594fdb6.52eb2a02235647.5426665702277259900@siddh.me>
In-Reply-To: <20220731181131.GB3569921@berlinger>
References: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
 <20220723135447.199557-1-code@siddh.me>
 <Ytv/4Tljvlt0PJ2r@kroah.com>
 <3558070.1658933200@warthog.procyon.org.uk>
 <182407602ce.190e58816827.7904364186178466266@siddh.me>
 <20220731181131.GB3569921@berlinger>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Marius Fleischer <fleischermarius@googlemail.com>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Priyanka Bose <its.priyanka.bose@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gU3VuLCAzMSBKdWwgMjAyMiAyMzo0MTozMSArMDUzMCAgRGlwYW5qYW4gRGFzIDxtYWlsLmRp
cGFuamFuLmRhc0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDI3LCAyMDIyIGF0IDA5
OjUwOjUyUE0gKzA1MzAsIFNpZGRoIFJhbWFuIFBhbnQgd3JvdGU6Cj4gPiBUaGFuayB5b3UgZm9y
IGV4cGxhaW5pbmcgaXQhCj4gPiAKPiA+IEkgd2lsbCBzZW5kIGEgdjMuIFNob3VsZCBJIGFkZCBh
IFN1Z2dlc3RlZC1ieSB0YWcgbWVudGlvbmluZyB5b3U/Cj4gCj4gU29ycnkgZm9yIGp1bXBpbmcg
aW4uCj4gCj4gV2UgaGF2ZSByZXBvcnRlZCB0aGUgc2FtZSBidWcgaW4ga2VybmVsIHY1LjEwLjEz
MSBbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBTlgyTTViSHllMlpFRWhFVjZQVWoxa1lM
MktkV1llSnRnWHc4S1pSendyTnBMWXorQUBtYWlsLmdtYWlsLmNvbV0uIFdlIGhhdmUgYmVlbiBz
dWdnZXN0ZWQgdG8gam9pbiB0aGlzIGRpc2N1c3Npb24gc28gdGhhdCB3ZSBjYW4gaGF2ZSBhcHBy
b3ByaWF0ZSBtZXRhLWluZm9ybWF0aW9uIGluamVjdGVkIGluIHRoaXMgcGF0Y2jigJlzIGNvbW1p
dCBtZXNzYWdlIHRvIG1ha2Ugc3VyZSB0aGF0IGl0IGdldHMgYmFja3BvcnRlZCB0byB2NS4xMC55
LiAgVGhlcmVmb3JlLCB3ZSB3b3VsZCBsaWtlIHRvIGJlIGluIHRoZSBsb29wIHNvIHRoYXQgd2Ug
Y2FuIG9mZmVyIGhlbHAgaW4gdGhlIHByb2Nlc3MsIGlmIG5lZWRlZC4KPiAKCkFzIHlvdSBhcmUg
c3VnZ2VzdGluZyBmb3IgYmFja3BvcnRpbmcsIEkgc2hvdWxkIENDIHRoZSBzdGFibGUgbGlzdCwg
b3IgbWFpbAphZnRlciBpdCBnZXRzIG1lcmdlZC4gWW91IGhhdmUgcmVwcm9kdWNlZCBpdCBvbiB2
NS4xMCwgYnV0IHRoZSBjaGFuZ2Ugc2VlbXMgdG8KYmUgaW50cm9kdWNlZCBieSBjNzNiZTYxY2Vk
ZTUgKCJwaXBlOiBBZGQgZ2VuZXJhbCBub3RpZmljYXRpb24gcXVldWUgc3VwcG9ydCIpLAp3aGlj
aCBnb3QgaW4gYXQgdjUuOC4gU28gc2hvdWxkIGl0IGJlIGJhY2twb3J0ZWQgdGlsbCB2NS44IGlu
c3RlYWQ/CgpJIGFjdHVhbGx5IGxvb2tlZCB0aGlzIHVwIG9uIHRoZSBpbnRlcm5ldCAvIGxvcmUg
bm93IGZvciBhbnkgb3RoZXIgcmVwb3J0cywgYW5kCml0IHNlZW1zIHRoaXMgZml4ZXMgYSBDVkUg
KENWRS0yMDIyLTE4ODIpLgoKVGhlIHJlcG9ydGVyIG9mIENWRSBzZWVtcyB0byBoYXZlIGxpbmtl
ZCBoaXMgcGF0Y2ggYXMgYSBwYXJ0IG9mIENWRSByZXBvcnQsIG9mCndoaWNoIGhlIHNlbnQgdjIs
IGJ1dCBoZSBzZWVtcyB0byBkbyBpdCBpbiBhIHJvdW5kYWJvdXQgd2F5LCBhbmQgYWxzbyBpbiBh
IHdheQpzaW1pbGFyIHRvIHdoYXQgSGlsbGYgRGFudG9uIGhhZCByZXBsaWVkIHRvIG15IHYyIHBh
dGNoLCB3aGVyZWluIGhlIG1pc3NlZAozNTNmNzk4OGRkODQgKCJ3YXRjaHF1ZXVlOiBtYWtlIHN1
cmUgdG8gc2VyaWFsaXplICd3cXVldWUtPmRlZnVuY3QnIHByb3Blcmx5IiksCnNvIEkgZ3Vlc3Mg
SSBjYW4gcHJvcG9zZSBteSBwYXRjaCBhcyBhIGZpeCBmb3IgdGhlIENWRS4KCk5vdGU6IEkgaGF2
ZSBhbHJlYWR5IHNlbnQgdGhlIHYzLCBzbyBwbGVhc2Ugc3VnZ2VzdCBhbnkgbmV3IGltcHJvdmVt
ZW50cyBldGMuCihleGNlcHQgcmVwbHlpbmcgdG8gdGhlIGNvbnZlcnNhdGlvbiBoZXJlKSB0byB0
aGUgdjMsIHdoaWNoIGNhbiBiZSBmb3VuZCBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1rZXJuZWwvMjAyMjA3MjgxNTUxMjEuMTIxNDUtMS1jb2RlQHNpZGRoLm1lLwoKQWxzbywg
eW91IG1heSB3YW50IHRvIGJyZWFrIHRleHQgaW50byBtdWx0aXBsZXMgbGluZXMgaW5zdGVhZCBv
ZiBvbmUgaHVnZSBsaW5lLgoKVGhhbmtzLApTaWRkaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QK
TGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVu
dGVlcwo=
