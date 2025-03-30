Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03C9149C55
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 30 Mar 2025 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743332854; cv=none; b=CTOv2C6vEvzYg040ugKom+nK1O8IL+CLbSvfCkh9aRXPm4XjUeS6prA3OacCq5/IfasY0p3McvnFUQXngEJggftsRnFd4/jQ9zfNQWQKY3yVxfX1XJyjG4ktNL2ZRrMKKm4DWjw5E5Z9MrY2AN0zyIAIJ/74hIiuT+gYHP4BRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743332854; c=relaxed/simple;
	bh=3Nef8ut+MWLHJT9xB9Q9TOJncLb47l7lZyVvuyZOU1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=UjFwCnylZ5CLLJgCQMK25E0cM7mWNBkr4eSJkheOfROSWFqbPjY9T3xFA27AuadDIDUmPwDDPPbjyvIYnblL4VdkL9lO1ylajZFMnXix56Ok2fK1x+Bz9AoS+t2nFJZmWGl46j9ddLfDCLEoswfNt+sK9wotQgSmpVQ4hi4u2uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=O5orLCr8; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="O5orLCr8"
Message-ID: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743332848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X7nFE8EaL7ypg1gtpW643ijiaICmuFoCS56xQp9JYe0=;
	b=O5orLCr8cobR9xnpM3ovlxCYU/c2kLA0uhBsbMiRBDyUjmJq9d9lqrGKy5pgk26hpSQBrO
	yO/SfSwmzhp2QYFTtfOIXIs8e5yabeT2t/f+le3tRBc4CGGsTqYa+JssXekCC6ghD6ZWDE
	WojBTmP8N0GvSkpIdiUNWR8iOUh1T7ifd8M8+Dn/lTckiIYCG6j7X1Xb6JBvWTUgHFnWHq
	yjCN0c26tOW8i4DEc1OKUG4n57xrfn+RfW0Fji8Bi9sXEaR2ugi0rNzKzX1zduUY63xX4f
	xspiDLLSePsvAuxDpvuZWc4P5eE7wmpnYsu8mi3QKqklGI1d8NnByVwAWzh2Ag==
Date: Sun, 30 Mar 2025 13:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Subject: Potential translation of LKMM docs into ReST
To: lkmm@lists.linux.dev
Cc: mchehab+huawei@kernel.org, paulmck@kernel.org, joel@joelfernandes.org,
 Akira Yokosawa <akiyks@gmail.com>, linux-kernel-mentees@lists.linux.dev,
 peterz@infradead.org, stern@rowland.harvard.edu, corbet@lwn.net,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello!

There is interest [1] to get the memory model documentation into the 
built docs. Akira pointed out that this was discussed in the past [2].

A couple of years have gone by, so I was wondering whether the decision
to keep plain text documentation still applies. 

There is an "easy" way [3] to get the plain text documentation into the
built docs, but I would be happy to work in a conversion into ReST if
that's what you want :)

Ccing people involved in [2]

Thanks!

[1] https://lore.kernel.org/all/87o6y5lvvg.fsf@trenco.lwn.net/
[2] https://lore.kernel.org/lkml/20190901133530.GL4125@linux.ibm.com/
[3] https://lore.kernel.org/all/20220927160559.97154-7-corbet@lwn.net/
