Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7E2D02E
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Nov 2023 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UTR6ErjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581EDC433C8;
	Tue,  7 Nov 2023 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699382433;
	bh=qRl7D92TRp1jOXPKIShTNC57HQTaGm5gk2QTBXKsEDE=;
	h=Date:From:To:Subject:From;
	b=UTR6ErjCGo7BZ65xyL8sg1PuFaOr9KP9eHAy0VYUjyJS0y2JwDLBZ7RpFq8I2yWly
	 JRqtvVtPNxuIwKZkKZX6IegDLgoTop01eSZUZJkewAuwfI9/aGytRhA6XaSnCG+fg0
	 zxxmepyNpV5YkhLuOPXVYm9jNDJYS5yDkifJ6TZQ=
Date: Tue, 7 Nov 2023 13:40:32 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-kernel-mentees@lists.linux.dev
Subject: The new list address is: linux-kernel-mentees@lists.linux.dev (old
 one still works)
Message-ID: <20231107-oxpecker-of-authentic-warranty-fe2a6d@meerkat>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This is a test of the new list address. Please update any of your address
books to reflect this change, but keep in mind that the old address should
continue to work for the foreseeable future.

-K
