Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE80835E1A9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 31 Jul 2026 06:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478141; cv=none; b=U34Scf3TSNIhItnLs89tRzK3s0Efodi665gxgpfW1PYt4Nmvy4k7/Fwl6nsbUP5Cdw0uHs0u3ekOrbzNo8EoJkcvZBxspkm3ARZbMkg6MuE4b8jJ9Vr1W/wfumg1TFbNIsVvwgE6wi7PSioEOGat7rSE3aF4WqWjStKnBckIkqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478141; c=relaxed/simple;
	bh=IrgGbmrUS8k54MHMXsePCUdz1GFsIjZYquGOEHpBvdQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rChvyJSAGLt+3SZVR+OcxG1itcHu8v1KZWvEide6XP1oCNovWJuMFIGbnIDEaixmYLOD8G53lP5Ua2p4PJ8qPjmTPmk9eSP0mOC0ImoKRurm1hwjgVwuyqgVliCp6KZAfKc3rY8z40J6JXyantyOS6eiczWvlYYM0I/Pi8WsWoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=J4RZirsH; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="J4RZirsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785478137; x=1786082937; i=markus.elfring@web.de;
	bh=IrgGbmrUS8k54MHMXsePCUdz1GFsIjZYquGOEHpBvdQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J4RZirsHhXsaJXCQ6gPXNFSsACcIoKYXjzAEoS/8ZLNPAAptXMh3i2V8VwcKFfrE
	 LocTSkCgGcC84PRqH7qBXcEw6ees+B10PUxdwXBazOGC0SxrmNx1sjhHA5QVuhzSJ
	 9GnqdLJVGaAqWMbdAHxTJOL3jvpSfvA4Byz2JlHbBUP/6ILxmtQOmzBmBKtlt+Xs8
	 q2wnhkDPvjhPJLzLgTfen3OV4N8+E8Br3Vzw4NT1bNj9I4T7GUYev4xKLXUSkJcPc
	 n0kcSVrLN3wDhTesEr9GNRMaRNmen3Lxtvdj4b3dNVawuawV+766s+6xle2jBxQiX
	 Ipo0KiiFpF+kkAp1Ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWkh-1xUDtE3Zbf-00f7MP; Fri, 31
 Jul 2026 08:03:19 +0200
Message-ID: <cfa36a22-d54a-4caa-942d-d12e06abdd75@web.de>
Date: Fri, 31 Jul 2026 08:03:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?w5NzY2FyIE1lZ8OtYSBMw7NwZXo=?= <megia.oscar@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel-mentees@lists.linux.dev,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20260731053047.24503-1-megia.oscar@gmail.com>
Subject: Re: [PATCH] ttm: Add error handling for ttm_pool_mgr_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260731053047.24503-1-megia.oscar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qYBc9VccyIp/X69Bw9OOwkIc2T9qTzMndgI+I7xSTI3v8QiH40W
 9SF1/YdBnzxtOAH9lR+Z8mHo9BPoFOqYys7/gy3b5OfT6AZF/6DfbiMwacOqDcz7EjUPhSE
 gxdv48GVwGSpUSqcpdE+rHjbWkvgHd7eUYIBH2vPwQTRBW4pJC/gaD72KDD/CO3Oi2mVW+l
 iEqifDHXKKvAT5z1RcmJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DenThegwdfA=;GU9hdgUTadSLn7MnluT7BrQlLGP
 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

=E2=80=A6
> Fix this by checking the return code and jumping to the error path
> on failure.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2-rc5#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc5#n34


Regards,
Markus
