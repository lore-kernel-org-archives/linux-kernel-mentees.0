Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E48BF8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Jul 2025 21:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752961572; cv=none; b=HvCjcFnm4Vj9Ors6oPrmqCkFbve6t3kHDkmnyW1TNM6G82ZHy0Vbah4DmNudqlVWv4due9bucQ7zC0zXMJ2Ok9MQWZhy7/virY2Rs+sOkdP8R2x2J/3dzexNwDgNH/wrExudu/S8wA3ckHMqBeux+IGhJD39v+abBNND6QLAlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752961572; c=relaxed/simple;
	bh=K7fmwbzAGB5SviPmGFl+B09mUOuJ9NRY2Punbj4PEfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BRF/ye5KOIHIar3yGc+M9W0CTHIVyiua52VxtdSxLpqCB8aN27/TyvMw46NdhnB8xtK+3Dap3gtCae/ZjUgfTer3oU380TAjeUthCv/ZekDkQ6vNhwKAurCAF269XnXSEgm3HXQov+2r9YwoOzdMXS7NzbkoszFORUU2YTCu0Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=eQBdRZBC; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="eQBdRZBC"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC3360B90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Jul 2025 21:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQQ7j9Cl2NXQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Jul 2025 21:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B03B56148F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=mit.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03B56148F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=eQBdRZBC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B03B56148F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Jul 2025 21:46:08 +0000 (UTC)
Received: from trampoline.thunk.org (pool-173-48-117-186.bstnma.fios.verizon.net [173.48.117.186])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 56JLk1af009673
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Jul 2025 17:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1752961564; bh=exflGeeC4CnyyIBrcYnERcNj2c+ONgP0MDuvyGETvs8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eQBdRZBCWYDQ6fdES3LPsxSp2HFiYmX15OSSgZ+SEzIZd8O01X2YnK74p7tOrB/Tk
	 SUJoH11MN/ldLAmq4f0AFpqLkxSzobcQ6JBuDZPSSlxaguZ/aiGp08dtOEFtVnjHPX
	 U9mh+qKUnOK01wiQlZ32Octf89IXktoNmFr3A+vsVYI5s5F0GwB9buDFI6m7qeBdjG
	 4bj78mndaWXKk04oj0Jce1j6nOwXifD39VfsB1Ys3aX2b9hkiC4fKSYHI0WVdJgu4b
	 adUakxEN4nJgX/pY2johgCftVaR4B8Pch8nulOijyzQ6G/xviigjxASegIU2ut6W0b
	 GwizKCrXTXjMg==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 250E22E00D9; Sat, 19 Jul 2025 17:46:01 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] ext4: Refactor breaking condition for xattr_find_entry()
Date: Sat, 19 Jul 2025 17:45:55 -0400
Message-ID: <175296153001.397842.9125557926811806145.b4-ty@mit.edu>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250708020013.175728-1-richard120310@gmail.com>
References: <20250708020013.175728-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Jul 2025 10:00:13 +0800, I Hsin Cheng wrote:
> Refactor the condition for breaking the loop within xattr_find_entry().
> Elimate the usage of "<=" and take condition shortcut when "!cmp" is
> true.
> 
> Originally, the condition was "(cmp <= 0 && (sorted || cmp == 0))", which
> means after it knows "cmp <= 0" is true, it has to check the value of
> "sorted" and "cmp". The checking of "cmp" here would be redundant since
> it has already checked it.
> 
> [...]

Applied, thanks!

[1/1] ext4: Refactor breaking condition for xattr_find_entry()
      commit: 9d9076238fe9fe45257f298bf51b35aa796cf0f1

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
