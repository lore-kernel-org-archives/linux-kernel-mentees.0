Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D478531E85C
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934288; cv=none; b=bIrJK/WaNU9o4p608kOtBp1c3UGaNV4GBlazF2t5i+XUnLTkKKgkipBe2pahxAklIuNlzImLGZT2My4+jC8ZW9MrvrriESlB+J8PA4XWUPJw0Ka35QsWqI1+HcZ//GdT4j52CVzj3enMj4AjcWnPHbi9XKyivrs4DNV57tFzFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934288; c=relaxed/simple;
	bh=RWtboy/CcnaHR54wR2hWm7p8Ryfk8djKCJBMrmFAtuQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TCxewQHMhrnp1sG2pEPZheOTDkvlM6toUok2ftKyb91x4luWsCK9F0oLa+j7O2/OfZopghe5c1ziPOPpfDgbpFlCdoWTAP9pp6/aDuLxHu2wvnfxrpvYJj3hHhjtnrimO3x8eTvNfYrMIuFE7RtnSGvG+y4T7EB3g7W8yNPMR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 63ABE1201C6;
	Mon,  8 Jun 2026 15:52:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id A023220029;
	Mon,  8 Jun 2026 15:52:01 +0000 (UTC)
Message-ID: <df0a4e75dc79b874b0e20fc5e153e2a22b2cf9f3.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
From: Joe Perches <joe@perches.com>
To: Manuel Ebner <manuelebner@mailbox.org>, open list	
 <linux-kernel@vger.kernel.org>, kernelnewbies
 <kernelnewbies@kernelnewbies.org>,  mentees
 <linux-kernel-mentees@lists.linux.dev>
Date: Mon, 08 Jun 2026 08:52:00 -0700
In-Reply-To: <85761322b578c87381553baf479491a55a5b8b24.camel@mailbox.org>
References: <20260608152242.61223-2-manuelebner@mailbox.org>
		 <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
	 <85761322b578c87381553baf479491a55a5b8b24.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A023220029
X-Stat-Signature: 8uoh61ba6pu96g4sduhj6xgu9pgymygk
X-Rspamd-Server: rspamout07
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/mswH4NdBmis+Iuip+/PRPIFyLA3Joge0=
X-HE-Tag: 1780933921-46371
X-HE-Meta: U2FsdGVkX18Zbb7JJz5Q6Mjok6t44xfSP9TRD9WNWc7Z0JI8C2DbR5LqkDpYEztIZl+MUKlRDyMpxjNmuTbfesosLRgkJgbDH3k4DvJ8BrjqmA2hbCkf/iylNNLbpsHsbOrhPnA0A8rs9r08+6SxL1QquAWUjtLlGt/Smn3bPB8NF2yvVvmFVgA4tBxMh6jxCDFdZ0UK2HSZCLxSzT6qJ3PaJi4FQOOPV0UYZgBrCI/8e/h+50w5q246Jc8pPKvmLIaLsRZJQ3gN7xQZmvChPifwvmBLfu8yTdRXVNIurGF717lI1zpyu8Z9kcjvCop8

On Mon, 2026-06-08 at 17:46 +0200, Manuel Ebner wrote:
> On Mon, 2026-06-08 at 08:29 -0700, Joe Perches wrote:
> On Mon, 2026-06-08 at 17:22 +0200, Manuel Ebner wrote:
> Add all people tagged in all the mentioned commits to the output of this =
script.
> > Why?
>=20
> Because sometimes there is a reason to add them. Doing so with get_mainta=
iner
> spares the manual copying and pasting.

Please specify this reason in the changelog.
