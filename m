Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5B7C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 21:00:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAEC21734
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 21:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBAEC21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 98B6E20528;
	Tue, 21 Jan 2020 21:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWjRZqccE3Hn; Tue, 21 Jan 2020 21:00:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34F332051B;
	Tue, 21 Jan 2020 21:00:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13938C0176;
	Tue, 21 Jan 2020 21:00:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3CA3C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 21:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EA82A86272
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tya1ctcLLdop
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 21:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7427783C12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 21:00:44 +0000 (UTC)
Received: from albireo.burrow.ucw.cz (albireo.ucw.cz [91.219.245.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "albireo.ucw.cz", Issuer "ucw.cz" (verified OK))
 by jabberwock.ucw.cz (Postfix) with ESMTPS id 1BECB1C036D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 22:00:42 +0100 (CET)
Received: by albireo.burrow.ucw.cz (Postfix, from userid 1000)
 id E899F1A0561; Tue, 21 Jan 2020 22:00:41 +0100 (CET)
Date: Tue, 21 Jan 2020 22:00:41 +0100
From: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Message-ID: <mj+md-20200121.205559.30897.albireo@ucw.cz>
References: <20190704000819.25050-1-skunberg.kelsey@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704000819.25050-1-skunberg.kelsey@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.70 / 15.00]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; BAYES_HAM(-3.00)[100.00%]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DMARC_NA(0.00)[ucw.cz];
 SENDER_REP_HAM(0.00)[asn: 51744(0.26), country: CZ(-0.00), ip:
 91.219.245.20(-0.37)]; RCPT_COUNT_FIVE(0.00)[5];
 HFILTER_HELO_NORES_A_OR_MX(0.30)[albireo.burrow.ucw.cz];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; AUTH_NA(1.00)[];
 HFILTER_HELO_IP_A(1.00)[albireo.burrow.ucw.cz];
 NEURAL_HAM(-0.00)[-0.409]; R_SPF_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:51744, ipnet:91.219.244.0/22, country:CZ];
 TAGGED_FROM(0.00)[f-210120,linux-kernel-mentees=lists.linuxfoundation.org];
 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: 1BECB1C036D
Authentication-Results: jabberwock.ucw.cz; dkim=none; dmarc=none;
 spf=none (jabberwock.ucw.cz: domain of mj@ucw.cz has no SPF policy when
 checking 91.219.245.20) smtp.mailfrom=mj@ucw.cz
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/2] lspci: Add lspci support to
 decode AIDA64 and dmesg log files
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

SGVsbG8hCgo+IEFkZCBsc3BjaSBzdXBwb3J0IHRvIGRlY29kZSBBSURBNjQgbG9nIGZpbGVzIGFu
ZCBkbWVzZyBsb2cgZmlsZXMgd2l0aAo+ICJwY2k9ZWFybHlkdW1wIiBwYXJhbWV0ZXIgdG8gb3V0
cHV0IFBDSSBjb25maWd1cmF0aW9uIHNwYWNlIGluZm9ybWF0aW9uLgo+IAo+IAlQYXRjaCAxOiBB
ZGQgbHNwY2kgc3VwcG9ydCB0byBkZWNvZGUgQUlEQTY0IGxvZyBmaWxlLgo+IAo+IAlBSURBNjQg
bG9nIGZpbGUgaW5jbHVkZWQgaW4gcGF0Y2ggZm9yIHRlc3RpbmcuIFVzZSB0aGUgZm9sbG93aW5n
Cj4gCWNvbW1hbmQgdG8gcnVuOgo+IAo+IAkJbHNwY2kgLUYgdGVzdHMvYWlkYTY0LWR1bXAKPiAK
PiAKPiAJUGF0Y2ggMjogQWRkIGxzcGNpIHN1cHBvcnQgdG8gZGVjb2RlIGRtZXNnIGxvZyBmaWxl
IHdpdGgKPiAJInBjaT1lYXJseWR1bXAiIHBhcmFtZXRlci4KPiAKPiAJZG1lc2cgbG9nIGZpbGUg
d2l0aCAicGNpPWVhcmx5ZHVtcCIgaW5jbHVkZWQgaW4gcGF0Y2ggZm9yCj4gCXRlc3RpbmcuIFVz
ZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQgdG8gcnVuOgo+IAo+ICAgICAgICAgICAgICAgICBsc3Bj
aSAtRiB0ZXN0cy9kbWVzZy1kdW1wCgpHZW5lcmFsbHksIEkgbGlrZSB0aGUgaWRlYSBvZiBhZGRp
bmcgdGhlc2UgdHdvIGZpbGUgZm9ybWF0cwp0byB0aGUgZHVtcCBiYWNrLWVuZC4KCkhvd2V2ZXIs
IGNvbWJpbmluZyBwYXJzZXJzIG9mIGFsbCB0aHJlZSBmb3JtYXRzIHRvIGEgc2luZ2xlIGJsb2Nr
Cm9mIGNvZGUgbG9va3MgcHJldHR5IHNjYXJ5LiBXaXRoIGEgY291cGxlIG9mIGZvcm1hdHMgbW9y
ZSwgdGhpcyB3b3VsZApiZWNvbWUgYW4gdW5tYWludGFibGUgbWVzcy4KCkkgd291bGQgcHJlZmVy
IHNlcGFyYXRlIHBhcnNlcnMgYW5kIGV4cGxpY2l0IHNlbGVjdGlvbiBvZiBpbnB1dCBmb3JtYXQu
CklmIHlvdSB3YW50IGFueSBoZWxwIHdpdGggaG93IHRvIGludGVncmF0ZSB0aGF0IHRvIGxpYnBj
aS9sc3BjaSwgcGxlYXNlCmxldCBtZSBrbm93LgoKQWxzbywgcGxlYXNlIGRvY3VtZW50IHdoaWNo
IGZvcm1hdHMgYXJlIHN1cHBvcnRlZC4KCgkJCQlIYXZlIGEgbmljZSBmb3J0bmlnaHQKLS0gCk1h
cnRpbiBgTUonIE1hcmXFoSAgICAgICAgICAgICAgICAgICAgICAgIDxtakB1Y3cuY3o+ICAgaHR0
cDovL21qLnVjdy5jei8KVW5pdGVkIENvbXB1dGVyIFdpemFyZHMsIFByYWd1ZSwgQ3plY2ggUmVw
dWJsaWMsIEV1cm9wZSwgRWFydGgsIFVuaXZlcnNlCiJJIHRoaW5rIGl0J3MgYSBuZXcgZmVhdHVy
ZS4gIERvbid0IHRlbGwgYW55b25lIGl0IHdhcyBhbiBhY2NpZGVudC4gOi0pIiAtLSBMYXJyeSBX
YWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
