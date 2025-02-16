Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817B39450
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739722317; cv=none; b=rH7C3G3RdmHC00/6aidvoCA4X7PH5NNuma1gdIhldS07GsGhWczTPzc2C7D/wmJCILG3t18mo4dLivS0ZjL3CINkbF+jLL4fqQPz4MNf4xIcJg24UYl/P7N/PDB99LUR4D5YkBW/RgJbDDM5UF1PApYozO92McuXVSNw4VcDi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739722317; c=relaxed/simple;
	bh=IuYx+RCyfyZ6iqiPjwSDvnja0Qr0myQxPu/vJqnSYdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJu/45uVz1Mr6Wv1Lncz4QbJDcckERZagZolZy0ghfO4Z1F8my/RXYOl1JHyHInepz7UGwMO3mVzkWR5E3cpB9x1mEaYjyjsczJJztWURH+O79gH4zgYcuxyRRat8XDpAGjGQ7mNouyCcyH0XrNtXzsRDKtL2NFUXalpscnpKP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfNO+Eem; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfNO+Eem"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D8484042C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 16:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJN17IQOZs-i for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2025 16:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=tj@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 54F6540350
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54F6540350
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OfNO+Eem
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 54F6540350
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Feb 2025 16:11:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9F735C56D9;
	Sun, 16 Feb 2025 16:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CF5C4CEDD;
	Sun, 16 Feb 2025 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739722312;
	bh=IuYx+RCyfyZ6iqiPjwSDvnja0Qr0myQxPu/vJqnSYdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfNO+EemfjTmmipKYxMl+sGeair0y8gIwc0AFZbmNMvzUV4cW+2l6vzU1UoMZxtbg
	 CIU37PKhq/+0idxPtUnqDbxCMCMGxm2jbRyW73MHzrtZ7iov0QmDXiADDMt0XZVKrJ
	 wvfrzr2jO0jt3Ct2Wbl5vRFXWg+oi1sywkPm7NaHMywgxH8FcMHNrF49SOqalERvBH
	 lLAnxDCza/Mcl2xz3UQOlE3Mw5lMyhMOZCJO7ViwOBwo4NFa4LIuT0unURdmK8bmwr
	 UnPl/fFbWWqsz0oZ4BM5dNpVShpOnIpigxgVyw2wSbRx3qXFYDGUUtqYc3urrOHGRx
	 HuSEqo2N4SbjQ==
Date: Sun, 16 Feb 2025 06:11:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Aditya Dutt <duttaditya18@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: make shell scripts POSIX-compliant
Message-ID: <Z7IOR2UNzjy7cQA7@slm.duckdns.org>
References: <20250216120225.324468-1-duttaditya18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216120225.324468-1-duttaditya18@gmail.com>

On Sun, Feb 16, 2025 at 05:32:25PM +0530, Aditya Dutt wrote:
> Changes include:
> - Replaced [[ ... ]] with [ ... ]
> - Replaced == with =
> - Replaced printf -v with cur=$(printf ...).
> - Replaced echo -e with printf "%b\n" ...
> 
> The above mentioned are Bash/GNU extensions and are not part of POSIX.
> Using shells like dash or non-GNU coreutils may produce errors.
> They have been replaced with POSIX-compatible alternatives.

Maybe just update them to use /bin/bash instead? There haven't been a lot of
reports of actual breakges and a lot of existing tests are using /bin/bash
already.

Thanks.

-- 
tejun
