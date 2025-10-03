Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B502367D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759502236; cv=none; b=j7Usy7fod1IZFCcaMW9OFriwNHk6A6v+ROfyEeIWpXBTXKibhlarjNahyFhAdly/NXqjcoO1cQzUpm9+/0n05KseqnsR2/iJ2hEVd6B4JyWDZ2QIIxRuMO5j0ZrKDUPu3htzT5un97RTnz16bgczuJU5LyipdxmT7DWovTQqMo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759502236; c=relaxed/simple;
	bh=A8BE/uZ4bRaKp1mPV9yFBcD9cYck3xUZ4rs0/g7nu58=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=DHPuVzENDmxICVilAzzJS4d1GDjUGK1hv+V9qufxCpIJ4JEtP9+qGknZe3ND1cmNbHp/tfBpjDnunQkUGApnuBjZrMQN1MUECk6R4pBzSe/fUFo9P1HSGV7xkDKxObiiRv6ZPNp0TJV6YEPeNBK29R3hvOmpvLA3mR1mD1mi2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gn8sDZE+; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gn8sDZE+"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A37A60E4F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyoF24NEpAAI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Oct 2025 14:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=tj@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 885F66067C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885F66067C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gn8sDZE+
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 885F66067C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  3 Oct 2025 14:37:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C809643B02;
	Fri,  3 Oct 2025 14:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B33C4CEF5;
	Fri,  3 Oct 2025 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759502232;
	bh=A8BE/uZ4bRaKp1mPV9yFBcD9cYck3xUZ4rs0/g7nu58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gn8sDZE+GryUQdOH+GQI41Fhen0WhGw/zKHf+BheQHh4CtLEb0rk5OrITqhxP3oxS
	 Xw7qZDz1O9OEkEC2SyfzpRgg5aYlCzopIiRukuBIJrIzcvtUZn6xqQ6XbByUrrP+M4
	 08aYbosghWe6EQKOjBV5HScCPues74BpqDTVCFtQnwJOM/GjfQD8PEDH2TsFt3tTiz
	 V2P7laVfO7RuLsP1nZiDas3CVa4bY56eXRCKVOckHVIAi6rPEGS7seG4CEbHsqlb5v
	 XWZDX5h8TdNeZ/ZO7Na6NV9ha75BrCs3BGKDyBrmsxsOjCCqP3YlKZDVQcyiC4c4HA
	 ERvB1D7opA+AA==
Date: Fri, 03 Oct 2025 04:37:11 -1000
Message-ID: <0cc44bb7e9ea51e6d031356218bd3c85@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Koutný <mkoutny@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Tiffany Yang <ynaffit@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] cgroup: Fix seqcount lockdep assertion in cgroup freezer
In-Reply-To: <20251003114555.413804-1-nirbhay.lkd@gmail.com>
References: <20251003114555.413804-1-nirbhay.lkd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>

Applied to cgroup/for-6.18-fixes.

Thanks.

--
tejun
