Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974D17729
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N14OP4J2"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3742141833
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3742141833
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=N14OP4J2
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AY07fOvklbjS
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 12 Nov 2023 19:58:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 40AC341823
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Nov 2023 19:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40AC341823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AxPWky8NgZXZgwIefkde46kXQyGnPtFMJa67Ozdq3xg=; b=N14OP4J2dGP4odkJ3Q3RdCOU1m
	M6xlmsUVo97FAKy8mkEFQTjOor2I/Xbh0qi55uqV0aQhX+jiu4h2GuybEusKh0uLcYS+LxZcjHhSm
	xd9Hvooh3jvSjPhIZ1eKnSnTtRvA59uVSAOFdhoq8bFJpPt/Zgi3ZIuNRFnmCU1rMqshGZLOzGDqp
	QDpHi6Psrjlw2L5UQFWk1Gy7+LnidkUYBtK+0sPa+UnIErNh2Qd2TMuFrlY807QGeOishUV+z7H7j
	WfIquTW+4yZ4xnrhqT3gj5i4xb2JEz5z1MxslOEHGhW8u28mpOwu7BvohWjzBGVlbNeuY89NyWTBq
	9Mn46J6g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2GbP-000ZDz-2f;
	Sun, 12 Nov 2023 19:58:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7AA97300427; Sun, 12 Nov 2023 20:58:39 +0100 (CET)
Date: Sun, 12 Nov 2023 20:58:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
	mst@redhat.com, michael.christie@oracle.com, mjguzik@gmail.com,
	mathieu.desnoyers@efficios.com, npiggin@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v4] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231112195839.GA9987@noisy.programming.kicks-ass.net>
References: <202311031320.c3ebc782-oliver.sang@intel.com>
 <20231112193055.2072382-1-singhabhinav9051571833@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112193055.2072382-1-singhabhinav9051571833@gmail.com>

On Mon, Nov 13, 2023 at 01:00:55AM +0530, Abhinav Singh wrote:
> This patch fixes the sparse warning with this message 
> "dereference of noderef expression" , in this context 
> it means about directly dereferencing a pointer tagged 
> with __rcu annotation.

Please, stop this madness. Just accept that sparse is a stupid tool and
the code is actually fine.
