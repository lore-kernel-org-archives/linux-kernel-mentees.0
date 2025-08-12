Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E61E5B7A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033549; cv=none; b=TVgERwsLa/3KHaXKloHe/gl01kU5rgfpWVec/YtKphAURhYfKSDx5A2SYdue+J6LiCvLOyIH7aNGQms7uIGyoFPjb2cneurdYR0Fk2AYqPCxcBP6fOevTvZ3OqR2KuWZQAevYEZzB8+gLymTS9Rv49HUzBncPR8M9BWgNROl9TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033549; c=relaxed/simple;
	bh=C2zsIVIRo1pylk2kBdWKqydnPuw2DK2XE1QOzi+K2Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OQTg5NwZfqoisY83ksHUKuXL2Hcjz1TWt5NVnF9k5aLAzLpmrlYg6/w93xNh2+CcOo/gsDwU9AMw5KGzWNrSdwZuOz1e56B1KQUHa7lxVkNtqlUoWmIM+AYtdTVDYTcwMUiNOAUsKPWFPoJf+nN1X3Urjd05BdEX3uxuzrAS7F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph4Apufw; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph4Apufw"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF2741CA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O89aMydSWOIs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 21:19:07 +0000 (UTC)
X-Greylist: delayed 400 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 12 Aug 2025 21:19:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB6A341BE7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6A341BE7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ph4Apufw
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sj@kernel.org; receiver=<UNKNOWN> 
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BB6A341BE7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:19:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C376A579EE;
	Tue, 12 Aug 2025 21:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C08C4CEF0;
	Tue, 12 Aug 2025 21:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033145;
	bh=C2zsIVIRo1pylk2kBdWKqydnPuw2DK2XE1QOzi+K2Y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ph4ApufwntcndTJnGDVGmB0Wmr1yJ8HPZDZgc7e5LAc7dboHafZfcWc9KW593YWoO
	 9GByk+s0/ICmwjvz8q/WO3AsiHH04F6hnS6BMUsKtbnexpJ8Ei4WLCny+HC2Z+6A56
	 Qae4cwPeTluct8Jnx0iGNN8tzkhHAD/ieTWjLwo0wiY8adxv/M7F13Tqv759TuxYbW
	 oqz9rw3kKM5pmpepb/FIZmerJaiofXh7ofYXL5N2xCJ6C2cQ8U5Rb//5ofmsfLNRk6
	 Iu/kVmlnv9uj2yft9SsFzycpvZk9ROAsq8JeZc4EtkhIrS5lIqieSKEfdCuOtrsc8E
	 MP4rVMHRhqSMw==
From: SeongJae Park <sj@kernel.org>
To: Soham Metha <sohammetha01@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev
Subject: Re: [PATCH v2 6/9] docs: damon: fixed spelling mistakes in documentation
Date: Tue, 12 Aug 2025 14:12:23 -0700
Message-Id: <20250812211223.61339-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250812204952.73136-4-sohammetha01@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

+ damon@lists.linux.dev

On Wed, 13 Aug 2025 02:19:49 +0530 Soham Metha <sohammetha01@gmail.com> wrote:

> found/fixed the following typos
> 
> - directores -> directories
> 
> in `Documentation/admin-guide/mm/damon/usage.rst`, and
> 
> - multipled -> multiplied
> 
> in `Documentation/mm/damon/design.rst`.
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Thank you for finding and fixing this!

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
