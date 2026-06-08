Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580A3DCD86
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932561; cv=none; b=M+JUrYPqooOuJkhKIR9cJ1It/C1DODbVnYajIQE6yGhi83BV5PlPHxzseGrM0GhajWh31e7y0mVh85v4iobrrTKDx4G+9pl8Hd5Ng1cosrjREbQtMKet/QoPQ1vBjg8Nv2FihbWKL4LhqbVd3ZUiKl8WuEjPXmriap+PKc4e7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932561; c=relaxed/simple;
	bh=rkA2VBb9ImV2jSujpsA29QPlEK15WhlEZw26pKyrs2A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVp0VWRZ2OhLf4ZJ4T6IwjJypWgKN2lVvO1H/qIeLqsXzoKRgB9GTSbuB4Wf7mujgkbXiz0Rhfpl4PGWF826q2xf/nyGm9OwzmyN7veWGAHCsEt1FvePMjicjaBKJxL58+Ev2tFgKPb2DAig3e/5IVGq2tHnvKzssG4/KJDJg4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf12.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 8C0461C0A6C;
	Mon,  8 Jun 2026 15:29:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id D899217;
	Mon,  8 Jun 2026 15:29:17 +0000 (UTC)
Message-ID: <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
From: Joe Perches <joe@perches.com>
To: Manuel Ebner <manuelebner@mailbox.org>, open list	
 <linux-kernel@vger.kernel.org>, kernelnewbies
 <kernelnewbies@kernelnewbies.org>,  mentees
 <linux-kernel-mentees@lists.linux.dev>
Date: Mon, 08 Jun 2026 08:29:16 -0700
In-Reply-To: <20260608152242.61223-2-manuelebner@mailbox.org>
References: <20260608152242.61223-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: D899217
X-Stat-Signature: azb9wkm8iougcptnfd3muakdbmyjfw6o
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1933Kx19DGTIiqztxvzkUznAzl8gQ+jItY=
X-HE-Tag: 1780932557-577056
X-HE-Meta: U2FsdGVkX19bV++ReL9u5XZBupuqsaqmZPXccaffSw5iEIt5KwltsW53ODE+jDNGgNPgjkRq38wpU82tV0viS0Y6yloBtKbxLy3iRdtXAkLES8r25RYahEc1wiKN7mCsNXy34ixbsnxgHSzk9q5u5pC8T0HaRUVcRK3biBshEnTBBInSoVE6Mnd11tGemTPrQIqFuhcE8aDQrbQ4czt0SHU1riBsOdq7W+odK2TDhj7FfrwyKI0ywQaR76/P+LS4CeP9GRbBWUf/eCCY0yeE8ZaxZqrb+iwudUNDncan06X/ssrvfd3eMathBfIO5mmE

On Mon, 2026-06-08 at 17:22 +0200, Manuel Ebner wrote:
> Add all people tagged in all the mentioned commits to the output of this =
script.

Why?
