Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572EAC33CAA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 20:52:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2343221734
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 20:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2343221734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ED7172052F;
	Tue, 21 Jan 2020 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9OOFsvkCbr8; Tue, 21 Jan 2020 20:52:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB5702038D;
	Tue, 21 Jan 2020 20:52:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96BA6C0176;
	Tue, 21 Jan 2020 20:52:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 473FEC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4378284F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 20:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNehVa46JCI9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 20:52:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E554D84D42
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 20:52:27 +0000 (UTC)
Received: from albireo.burrow.ucw.cz (albireo.ucw.cz [91.219.245.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "albireo.ucw.cz", Issuer "ucw.cz" (verified OK))
 by jabberwock.ucw.cz (Postfix) with ESMTPS id A94AC1C036D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 21:52:23 +0100 (CET)
Received: by albireo.burrow.ucw.cz (Postfix, from userid 1000)
 id 6AFAB1A0561; Tue, 21 Jan 2020 21:52:23 +0100 (CET)
Date: Tue, 21 Jan 2020 21:52:23 +0100
From: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Message-ID: <mj+md-20200121.205159.30795.albireo@ucw.cz>
References: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619164858.84746-1-skunberg.kelsey@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.70 / 15.00]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; BAYES_HAM(-3.00)[100.00%]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 HFILTER_HELO_IP_A(1.00)[albireo.burrow.ucw.cz];
 SENDER_REP_HAM(0.00)[asn: 51744(0.26), country: CZ(-0.00), ip:
 91.219.245.20(-0.37)]; RCPT_COUNT_FIVE(0.00)[5];
 HFILTER_HELO_NORES_A_OR_MX(0.30)[albireo.burrow.ucw.cz];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; AUTH_NA(1.00)[];
 DMARC_NA(0.00)[ucw.cz]; NEURAL_HAM(-0.00)[-0.412];
 R_SPF_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:51744, ipnet:91.219.244.0/22, country:CZ];
 TAGGED_FROM(0.00)[f-210120,linux-kernel-mentees=lists.linuxfoundation.org];
 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: A94AC1C036D
Authentication-Results: jabberwock.ucw.cz; dkim=none; dmarc=none;
 spf=none (jabberwock.ucw.cz: domain of mj@ucw.cz has no SPF policy when
 checking 91.219.245.20) smtp.mailfrom=mj@ucw.cz
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4 0/3] lspci: Update verbose
	help and show_range()
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

SGVsbG8hCgo+IEtlbHNleSBTa3VuYmVyZyAoMyk6Cj4gICBsc3BjaTogSW5jbHVkZSAtdnZ2IG9w
dGlvbiBpbiBoZWxwCj4gICBsc3BjaTogUmVtb3ZlIHVubmVjZXNzYXJ5ICF2ZXJib3NlIGNoZWNr
IGluIHNob3dfcmFuZ2UoKQo+ICAgbHNwY2k6IENoYW5nZSBvdXRwdXQgZm9yIGJyaWRnZSB3aXRo
IGVtcHR5IHJhbmdlIHRvICJbZGlzYWJsZWRdIgo+IAo+ICBsc3BjaS5jIHwgMjQgKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQoKVGhhbmtzLCBhcHBsaWVkLiAgQW5kIHNvcnJ5IGZvciB0aGUgZGVsYXkuCgot
LSAKTWFydGluIGBNSicgTWFyZcWhICAgICAgICAgICAgICAgICAgICAgICAgPG1qQHVjdy5jej4g
ICBodHRwOi8vbWoudWN3LmN6LwpVbml0ZWQgQ29tcHV0ZXIgV2l6YXJkcywgUHJhZ3VlLCBDemVj
aCBSZXB1YmxpYywgRXVyb3BlLCBFYXJ0aCwgVW5pdmVyc2UKQSBjb21wdXRlciB3aXRob3V0IFdp
bmRvd3MgaXMgbGlrZSBhIGNob2NvbGF0ZSBjYWtlIHdpdGhvdXQgbXVzdGFyZC4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRl
ZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgta2VybmVsLW1lbnRlZXMK
