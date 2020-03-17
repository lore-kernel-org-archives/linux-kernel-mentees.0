Return-Path: <SRS0=z9cQ=5C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26189C4CECE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 10:04:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07DD205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 10:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yUge6lqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07DD205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BABB32010F;
	Tue, 17 Mar 2020 10:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbkXuBK11fGq; Tue, 17 Mar 2020 10:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8BC8320022;
	Tue, 17 Mar 2020 10:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74A28C18DA;
	Tue, 17 Mar 2020 10:03:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74F0FC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 10:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70A2D88ACE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 10:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cK3XJK7pBAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 10:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E07F788AC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 10:03:56 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34113205ED;
 Tue, 17 Mar 2020 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584439436;
 bh=3oukVbkDCC1ZnviMpCKaL3jr7lAzIEZ7rEPJY9/SDz4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=yUge6lqqzy5U4PupB+UNdySETACVCkXszXQa/RAlqnO23F7yt4Doj2YhaZLsgMy27
 RTv8NnZDm1Ud496RE/yW41BIhkR5BFfZOQj2fGAHY22Rr6DsHo9xbIRPkiIiAOKkny
 jZmK/LTh3sAsg/FlRNS6uw8otQAZwQ81EbfqpW0E=
Date: Tue, 17 Mar 2020 11:03:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr,
 linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200317100354.GA1089518@kroah.com>
References: <537c752c-009b-1fa7-4bdd-c294790d453a@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <537c752c-009b-1fa7-4bdd-c294790d453a@web.de>
Subject: Re: [Linux-kernel-mentees] [Cocci] [v2 05/26] parsing_cocci:
 visitor_ast: Add cases for ParenType/FunctionType
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

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMTA6MzQ6MDhBTSArMDEwMCwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4g4oCmCj4gPiAtIENoYW5nZSB0aGUgInZpc2l0
b3JfYXN0MCIgaW4gcGF0Y2ggc3ViamVjdCB0byAidmlzaXRvcl9hc3QiCj4gCj4gVGhhbmtzIGZv
ciBzdWNoIGEgc29mdHdhcmUgdXBkYXRlLgo+IAo+IEkgc3VnZ2VzdCB0byByZWNvbnNpZGVyIHRo
ZSBwYXRjaCBncmFudWxhcml0eSBvbmNlIG1vcmUuCj4gV291bGQgeW91IGxpa2UgdG8gcmVkdWNl
IHRoZSBwb3NzaWJpbGl0aWVzIGZvciBjb25mdXNpb24gYXJvdW5kCj4gdGhlIHByZXNlbnRlZCBz
b2Z0d2FyZSB0cmFuc2Zvcm1hdGlvbj8KCk9uZSBvZiB0aGUgaGFyZGVzdCB0aGluZ3MgaW4gZGVh
bGluZyB3aXRoIGEgY29tbXVuaXR5IGlzIHRvIGxlYXJuIHdobyB0bwppZ25vcmUgd2hlbiBpdCBj
b21lcyB0byBwYXRjaCByZXZpZXdzIGFuZCBjb21tZW50cy4gIEp1c3QgYSBmcmllbmRseQpyZW1p
bmRlciB0aGF0IHRoaXMgcGVyc29uIGlzIG9uIG1hbnkgdXBzdHJlYW0ga2VybmVsIGRldmVsb3Bl
cidzCmVtYWlsLWJsb2NrIGxpc3RzIGR1ZSB0byB0aGUgYWJpbGl0eSB0byBjYXVzZSBodWdlIHRp
bWUtc2lua3MgZm9yIG5vCnZhbGlkIHJlYXNvbi4KCkkgc3VnZ2VzdCB0aGF0IG90aGVycyBkbyB0
aGUgc2FtZSBhcyB3ZWxsLgoKdGhhbmtzIQoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBs
aXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVs
LW1lbnRlZXMK
