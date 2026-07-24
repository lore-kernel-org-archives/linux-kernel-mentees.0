Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218D935CBD7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Jul 2026 05:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869988; cv=none; b=TV/PBgw5/wSiZ3p/yLyLsklmxp5hsyVUsDZYNGEU2z1inSPTpxXaVx4bHFi2jDr3gndpiWm9+oBgcI8d6/rMJj53IyKjsR0gT8Drpjx/NX7BT58clRPr/bHYnP1+w61LrQbrwDs2W1ohSK+qTh/5krwtqCVwUi5/+2hjB4MH3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869988; c=relaxed/simple;
	bh=aZaIhBWGLisPCeYu6TskeMgbguCJ6B/WhIXDVKyXQMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u4BmX/CMoSPCvCBmyVbdLueKmYXH4XSH3heW+BKzttf7iuihGJrFl4G45AlTqxnuEILQ4h0iU2pRXMORIzCSSfCd2V4yFfvCbN9hjkQWYm/4ACULt/D30eE9G9A1gKcuKCyNb/e6rgEWHfTvjHPrCgkpGxpFsEUU5nZLzDXLDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBLCmcpD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBLCmcpD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with UTF8SMTP id B11B54030E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Jul 2026 05:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 1uE9_KB3gipz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2026 05:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 076E84008A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 076E84008A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBLCmcpD
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 076E84008A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Jul 2026 05:13:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 2767960A5A;
	Fri, 24 Jul 2026 05:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7BF9E1F000E9;
	Fri, 24 Jul 2026 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784869983;
	bh=25616Ldk2j/7DZSEQzSSH1I12tZNHb600NxPAJa/HL4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iBLCmcpDkldCC78cHhkGvMx/Dp1TIDlKgBXdDf3XSjSs1U07+r7vXnLIrPbmUmnUV
	 EaWr0KPQr8blPqiY5cht7XyuB86G8mPT9/h/pRH+F9kNm7kbFs0cA0FUG4TxOanS2T
	 ZkC728TSg9+mXq2PHT5+3zdzDL1dsmKqI31cO2SDgCbGIPB8LOM85jFhp5HnLF0diC
	 49X6CTyACbvMfxBJBsJQTm5ANyJhdf1vsQz4PYCxL3yCSM99yuLG+wb00cJtedN1ZX
	 xZ2XAqnOLiCH9hf4lKeh5nHNrYE4eioTojJvpoQHycTUCwnYDKw9QdSAnYK6pYlzi2
	 DVJCILzGdDizQ==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260624044742.144852-1-robertusdchris@gmail.com>
References: <20260624044742.144852-1-robertusdchris@gmail.com>
Subject: Re: [PATCH v2] modpost: prevent leak when early return no suffix
 .o in read_symbols()
Message-Id: <178486966441.1793472.16336529421470867133.b4-ty@b4>
Date: Fri, 24 Jul 2026 07:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=aZaIhBWGLisPCeYu6TskeMgbguCJ6B/WhIXDVKyXQMo=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqYvMmxUaC5E0eWRBuYgDzkCHYKlA7L2UEkH8Tr
 RmID7tmxZGJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCamLzJgAKCRAHUgpwFiYS
 aYTaEACXuHA6nhAwfHthyTN+zf93HW5ATZGcCryLEUxIP6Q3g4+xLSI6xmlCIj2U3OaJGRWxaYP
 4DXEIXl2IlqVk4/XLUpcRvC3nkb8Jp8NlZzJr8HKV+8AN63p3T4g4hbH5PnhxmYW/gowOOpUHjE
 Pmo6xLO9rqm8hcQ0aSn8HZhFam1uwhmyBgOvgxMuqSP9GGU3VZVjGCTUUSgU6J3kbWrYLUaJ2El
 gWZoe0rZ8Fhz+NwnV65wqa6SM5iHxa8RjT/+DWYudDJ9VepDzYKrvqTNMK8tciXZTTntYIiQ/E5
 WoNzhSZYxkSwUKjaddG2dUtWVb3Q1qLf4zHU0WcXm3iwC3G8CoVuMZ+XOXhJ0oFq73OVoENGbwf
 5K+YtAS5nF9GJX6qZNzEuwL4ibzwroka1Ese/w+0PEqQZGK2YZ+AUsrkT/AzsEANBEce9fs+Fa1
 X0iQPrHnP0xDZwGIIeVvczVrIsU8pPD+u7Nr633uZ48A4z4eDA8ZiodbhvVD81wZg1nQfolSj0i
 Cv8Zy0j+aR8WVmsi/9IeO7rSTGC0NrvDMxR6OqUgyIcCy973ak5nSR7hFy2HKpOhv4MuI4GWKbx
 mxbmsm0UrO/V9Ld5BBs+Ut7sneEMRTSjB2yPAL7VnErrPI2ez15PyJiM9BDbqq7LVEWeTo4y85/
 pelk2VbdB5znm/A==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 24 Jun 2026 11:47:42 +0700, Robertus Diawan Chris wrote:
> modpost: prevent leak when early return no suffix .o in read_symbols()

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] modpost: prevent leak when early return no suffix .o in read_symbols()
      https://git.kernel.org/kbuild/c/f2308dd4

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


