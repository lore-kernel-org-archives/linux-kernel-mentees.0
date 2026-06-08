Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD42432B11F
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934437; cv=none; b=r39ySyBCfgapF3o/eHvBEui/dj7QHDBPnt1v5inI3wK2KtlQhrtKrbDFyRblrIp6xEw1e4XH47zOgDeKRPCCLFIEhTxyMn69uep9uH/UH9hA2To5C3nKTwx3H7XosptfnjvOSEhg0/xyOpLtgQg3AXlO8bDz5rBx/hC9ra0d31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934437; c=relaxed/simple;
	bh=VLuErjver/khX+Ob2JjgydW9Oz5RD4pMu94V1lgGYqU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NkEqsNzXYHBi26l8DtCCG6X/lIqy1+GZrFVxcfgCgMM9WLFnfrhdt+ZxrgSh0MwbApsAVZctyncni2n2J48ezpHLRNK/DzFh0WSIM6pL6I/LX/PRXKjtQkb7zl+rQbBC5rz735O+y3OciszPXRcJ1Dx0RYCx4XkDg8xAsoyD9aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id CFBBB1201CD;
	Mon,  8 Jun 2026 16:00:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id 070632002C;
	Mon,  8 Jun 2026 16:00:33 +0000 (UTC)
Message-ID: <4ae343e93c146218515676bba385286ded59e1c2.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
From: Joe Perches <joe@perches.com>
To: Manuel Ebner <manuelebner@mailbox.org>, open list	
 <linux-kernel@vger.kernel.org>, kernelnewbies
 <kernelnewbies@kernelnewbies.org>,  mentees
 <linux-kernel-mentees@lists.linux.dev>
Date: Mon, 08 Jun 2026 09:00:33 -0700
In-Reply-To: <b8e834c5e593cef91d7f9a4d4cd1d0b2a1c605e2.camel@mailbox.org>
References: <20260608152242.61223-2-manuelebner@mailbox.org>
				 <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
			 <85761322b578c87381553baf479491a55a5b8b24.camel@mailbox.org>
		 <df0a4e75dc79b874b0e20fc5e153e2a22b2cf9f3.camel@perches.com>
	 <b8e834c5e593cef91d7f9a4d4cd1d0b2a1c605e2.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 070632002C
X-Rspamd-Server: rspamout01
X-Stat-Signature: 3afwuj49hhyiua6zjosiudm6uopm4bf7
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX199b6o4ZJJUSFrqLlWNU2PLahHusEkvKSc=
X-HE-Tag: 1780934433-359862
X-HE-Meta: U2FsdGVkX18tM+FIYGmNVr4GERzrMcyd7ciXCong/OntJTlhuNFogcixTm1tXgUWnZTlUO5dgos2XtZblQbqScwouQKzzgV8vyd6gjlYr+tBaQ8qYEIbyaGgG26GxnOUeppfml8D4C9XmV8QgQBFVaDOvM5PfPH1+rgxATjgxdlh30D179eOML0klJ5Wm/PBw/4+K13H1HDof6M3xmypUStUnm281uDFjRRA5baI42BS4OefDoahY7ZdIUqO35fkemWNZCXePYUp2jW2d2+JS4nnplyj9LJ5WzJBVB8kamZKaj/rw3vTzCHwGJG4x+V9

On Mon, 2026-06-08 at 17:56 +0200, Manuel Ebner wrote:
> Is it ok to have this on by default or should I turn it off?

Has to be off.  Otherwise all the 'cc:' lines would be used.

And fyi: I doubt the utility of this new mechanism.
