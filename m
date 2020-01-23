Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A058C33CB6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 13:38:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDA220661
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 13:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIBtzhid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDA220661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 049E120425;
	Thu, 23 Jan 2020 13:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feE350EOVOlR; Thu, 23 Jan 2020 13:38:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3F8292042C;
	Thu, 23 Jan 2020 13:38:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2558BC18DD;
	Thu, 23 Jan 2020 13:38:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70534C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5F10486A35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2CSpJgjNcEH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:38:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A1BB869D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579786695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6uD+1e68gi91qvBrZ/lqf2TnuTpmHDoEyL/oCZyo6k=;
 b=MIBtzhidHuL3gfyTami1B0Gbw2dt3VeAgEK2l2zXxCLt5BRHa+Z5Ra85NforfACev7dXmx
 RSTaF6XDQ9gFnsTcdgjDrrELzFjjz7EZYVuU9q6M/Rm+YPYpIFQQK/CLWXlum7VPGxjPoD
 vELHZoHbIcyNhI+7GnS7Lz0mSCdOMkE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-pQAD3xRMOjqeSf9IBls2jQ-1; Thu, 23 Jan 2020 08:38:14 -0500
Received: by mail-lj1-f197.google.com with SMTP id z17so1088213ljz.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 05:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=h6uD+1e68gi91qvBrZ/lqf2TnuTpmHDoEyL/oCZyo6k=;
 b=dq1DXHyTBcsO1yoLZDW7f/Jp1Ce80km1BfRB/OYb9yB+8MsXjmcmaMfqhH5qAWpQ3K
 7STWjEntT/K/2C3DzPh0ZwuaQ/CHsVLz6FyKx2CDeNX65gJYYNkcsQ50vYvpvxCQuZiL
 JcTQVrBsYWGColAkM1XBUhafHk0AC3fMpEbheQkfpoRM+R1+aeshVKYGv1bAeR8cb6+F
 iXOVyf9qIa+UuzNmL1rXmt7dNVSfTiHxYkzqsEIPe2+vHQEzRRMRveLw1ohT4Q/dELNs
 isM5+S+jJC3jjbvR5rdItdBAIi4AfH4v/Wx9E7ViK+R9iLjeu5BT1Q7gAx899Y8Vi/ZU
 Ovwg==
X-Gm-Message-State: APjAAAVzPfyQY7MYfxhZs3Zlke97eK8+45JuerzuluuniiJKMHtR4VRI
 VCAZEjAYUG+fAJhM458wwuG610qAFnl4Hws5EfFppyEycCzaLpOJJNixnCc4aaVBiPq9gsvhaVd
 r/+HLUjmKG8kaB28i/tyhTdOkDALtq0LklMPPPd9aYnUn9fOJ
X-Received: by 2002:ac2:50da:: with SMTP id h26mr4787285lfm.80.1579786692704; 
 Thu, 23 Jan 2020 05:38:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4BWaWs+3H0Frdse6iV+jJqbBxUwLv0Dvg8acnZgByftBSE4MEGvlY+Jnho0dUBWe823FHAw==
X-Received: by 2002:ac2:50da:: with SMTP id h26mr4787274lfm.80.1579786692511; 
 Thu, 23 Jan 2020 05:38:12 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([85.204.121.218])
 by smtp.gmail.com with ESMTPSA id s4sm1309808ljd.94.2020.01.23.05.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 05:38:11 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id F36231800FF; Thu, 23 Jan 2020 14:38:10 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Amol Grover <frextrite@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>
In-Reply-To: <20200123120437.26506-1-frextrite@gmail.com>
References: <20200123120437.26506-1-frextrite@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 23 Jan 2020 14:38:10 +0100
Message-ID: <87d0ba9ttp.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: pQAD3xRMOjqeSf9IBls2jQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bpf: devmap: Pass lockdep
	expression to RCU lists
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

QW1vbCBHcm92ZXIgPGZyZXh0cml0ZUBnbWFpbC5jb20+IHdyaXRlczoKCj4gaGVhZCBpcyB0cmF2
ZXJzZWQgdXNpbmcgaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1IG91dHNpZGUgYW4KPiBSQ1UgcmVh
ZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24gYnV0IHVuZGVyIHRoZSBwcm90ZWN0aW9uCj4gb2YgZHRh
Yi0+aW5kZXhfbG9jay4KPgo+IEhlbmNlLCBhZGQgY29ycmVzcG9uZGluZyBsb2NrZGVwIGV4cHJl
c3Npb24gdG8gc2lsZW5jZSBmYWxzZS1wb3NpdGl2ZQo+IGxvY2tkZXAgd2FybmluZ3MsIGFuZCBo
YXJkZW4gUkNVIGxpc3RzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW1vbCBHcm92ZXIgPGZyZXh0cml0
ZUBnbWFpbC5jb20+CgpDb3VsZCB5b3UgcGxlYXNlIGFkZCBhbiBhcHByb3ByaWF0ZSBGaXhlczog
dGFnPwoKT3RoZXJ3aXNlOgpBY2tlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tl
QHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRl
ZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
