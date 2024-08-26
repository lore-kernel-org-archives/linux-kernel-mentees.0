Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDCC199E98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724705392; cv=none; b=hPb6v6EPR1PyFbyHZ0OQQEx9oQLs+r/kDh3wi+mzrW+io12paGkGhK7nVlS/wrANkvR3CgbnuplLdKOapZbmIhxeIBkrd14KmkY3MSz1BZangW9cR9wKlRr0bIr0yng+EqrS6oV8NquDkyI9I429DD/TBui0ZGrCUeFmvvEOsI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724705392; c=relaxed/simple;
	bh=3McNi8RQsTankaDswnfRhRdsB4CjvWxQfgNMRyZMaus=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IKk2kpisIJWkYouT6jA72StjmskBTga4LVeUO7XWT1dEIbfzIn94e/9tbvHiZe1NXiV2ZANBrT1IO1E21pbdgqrKQFA5Y7Ibe0Ej79i2BWpvJ8it/XT9yrOfl9RqSF6tMbyCYiBlYJe7DwOyZlTzp1+jHbnw2TcjYjXFEm68PYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqh98MfQ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqh98MfQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34E6240286
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.99
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVoTMRmu2_Fr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 20:49:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=todd.e.brandt@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38E454025D
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38E454025D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dqh98MfQ
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 38E454025D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724705390; x=1756241390;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3McNi8RQsTankaDswnfRhRdsB4CjvWxQfgNMRyZMaus=;
  b=dqh98MfQ5rgg7ueBjD+qHgzZ2OktoN6jR560RQuEDyMQ5S4dwV23jATJ
   i6XP/umqXlQBXjzvIXPJOhliYrCvltD+qyR2FbJo3iSzXELoQmod3MPCK
   kDN2CH+ysFGLRMa76XM9rqhZ7bDFQawJ8Mv3YOphWKA+MEQYod9Sfjxxk
   Vfvj9kpan0o5uzXbcZ7S2LICIfj5vJXGiP/i2rxGZM0MTVWKHZAg0s1su
   ryLdfLW/dTgbAlis3Q0F0A+WAhu+0PCkeddr8h7ZQi5wS72xY8SlXkTSX
   W1R+BF65G7sRGeJhH7QhVoucBf3DgyBjwVBLuK1em9iXIP6eUPYMiVuGK
   Q==;
X-CSE-ConnectionGUID: rNXf5a19STSXhdH2Q6Saqw==
X-CSE-MsgGUID: bs4N5hw2R4SoQhWsf5XzqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23020522"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="23020522"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:49:49 -0700
X-CSE-ConnectionGUID: 7pm1e44OQhCKRtsNU+DeTw==
X-CSE-MsgGUID: sI4AbRW+QvOdsOZoeOXjMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62681629"
Received: from dgramcko-desk.amr.corp.intel.com ([10.124.223.43])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:49:49 -0700
Message-ID: <7ea23975329e4a22fd235cc28d365296fec47739.camel@linux.intel.com>
Subject: Re: [PATCH] pm-graph: ignore sleepgraph.py artifacts
From: Todd Brandt <todd.e.brandt@linux.intel.com>
Reply-To: todd.e.brandt@linux.intel.com
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Mon, 26 Aug 2024 13:49:48 -0700
In-Reply-To: <20240825095353.7578-1-0xff07@gmail.com>
References: <20240825095353.7578-1-0xff07@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-08-25 at 17:53 +0800, Yo-Jung (Leo) Lin wrote:
> By default, sleepgraph.py creates suspend-{date}-{time} directories
> to store artifacts, or suspend-{date}-{time}-xN if the --multi option
> is used. Ignore those directories by adding a .gitignore file.
>=20
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> ---
> =C2=A0tools/power/pm-graph/.gitignore | 3 +++
> =C2=A01 file changed, 3 insertions(+)
> =C2=A0create mode 100644 tools/power/pm-graph/.gitignore
>=20
> diff --git a/tools/power/pm-graph/.gitignore b/tools/power/pm-
> graph/.gitignore
> new file mode 100644
> index 000000000000..37762a8a06d6
> --- /dev/null
> +++ b/tools/power/pm-graph/.gitignore
> @@ -0,0 +1,3 @@
> +# sleepgraph.py artifacts
> +suspend-[0-9]*-[0-9]*
> +suspend-[0-9]*-[0-9]*-x[0-9]*
This seems fine. If you run the tool inside the tools/power/pm-graph
folder I can see how it would be annoying to have all those output
directories show up in git status. (re-send with Acked-by)

Acked-by: Todd Brandt <todd.e.brandt@linux.intel.com>

