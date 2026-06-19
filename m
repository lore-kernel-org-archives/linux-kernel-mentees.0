Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC53BBFA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jun 2026 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903323; cv=none; b=Gruyftjj/bwmU3UZBKHk6kiCYoJCXbHwjEeiA40EBFlGdpNmuTaNAbvWrA1dRmVe4kyJqTmSk2oaHrKv3tyKskwpUwgrtRBphUKfmKWfT5nFc84b0M7O5pdeqJyBx0LKRFqC0p5WWHLZpi1Kn+duYhVbMqOk65ZeBJYbGGcIcSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903323; c=relaxed/simple;
	bh=oooXo17agqt59WPLk3K1n2OhubOgja7s+KkLia3OLv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCWVapCawoF1yGGkp5Jfc7/86ORDtbzsHBKXdXokbh7a/LRxp8op1zs1aFAmEzZpddngNaxzhAo1KWTKKdL7CxLp3w58Mv+ZcGM+NS8lRXg0Ws/JEb/pbIdrTyBnQ+pjtRZexlr0eMQpSbWXQtJU87AwY/+sq6IeYLecBn7HXE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99534EBD7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jun 2026 21:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.256
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVqEWIo3hL0r for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2026 21:08:39 +0000 (UTC)
X-Greylist: delayed 576 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 19 Jun 2026 21:08:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57F504EBD5
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=datenfreihafen.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F504EBD5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=78.47.171.185; helo=proxima.lasnet.de; envelope-from=stefan@datenfreihafen.org; receiver=<UNKNOWN> 
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 57F504EBD5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Jun 2026 21:08:38 +0000 (UTC)
Received: from work.datenfreihafen.local (unknown [46.253.254.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 041FEC0879;
	Fri, 19 Jun 2026 22:58:54 +0200 (CEST)
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: alex.aring@gmail.com,
	miquel.raynal@bootlin.com,
	Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: Re: [PATCH] mac802154: Prevent overwrite return code in mac802154_perform_association()
Date: Fri, 19 Jun 2026 22:58:49 +0200
Message-ID: <178190268127.829220.6513673834040282671.b4-ty@datenfreihafen.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602054133.470293-1-robertusdchris@gmail.com>
References: <20260602054133.470293-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello Robertus Diawan Chris.

On Tue, 02 Jun 2026 12:41:33 +0700, Robertus Diawan Chris wrote:
> When assoc_status not equal to IEEE802154_ASSOCIATION_SUCCESSFUL, the
> return value assigned to either "-ERANGE" or "-EPERM" but this return
> value will be overwritten to 0 after exiting the conditional scope.
> So, jump to clear_assoc label to preserve the return value when
> assoc_status not equal to IEEE802154_ASSOCIATION_SUCCESSFUL.
> 
> This is reported by Coverity Scan as "Unused value".
> 
> [...]

Applied to wpan/wpan-next.git, thanks!

[1/1] mac802154: Prevent overwrite return code in mac802154_perform_association()
      https://git.kernel.org/wpan/wpan-next/c/649147cb3f8b

regards,
Stefan Schmidt
