Return-Path: <SRS0=gpyO=6R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A62C28CBC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:31:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3122068E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 19:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3122068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C3C5E87D1A;
	Sun,  3 May 2020 19:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eWe+57YxrLW; Sun,  3 May 2020 19:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 393A387CB0;
	Sun,  3 May 2020 19:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23DB7C0176;
	Sun,  3 May 2020 19:31:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D972C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1F6F420385
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dThPyjm2-Dc0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by silver.osuosl.org (Postfix) with ESMTPS id 521F22034C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 19:31:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; d="scan'208";a="347593977"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2020 21:31:50 +0200
Date: Sun, 3 May 2020 21:31:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200428170228.7002-21-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2005032131190.2533@hadrien>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
 <20200428170228.7002-21-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH 20/32] parsing_c: ast_c: Add Cast
	attributes
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Tue, 28 Apr 2020, Jaskaran Singh wrote:

> Add cast attributes to the C AST. This is a list of attributes in the
> Cast type of the C AST.
>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/ast_c.ml  | 2 +-
>  parsing_c/ast_c.mli | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/parsing_c/ast_c.ml b/parsing_c/ast_c.ml
> index f25f9b55..6a828943 100644
> --- a/parsing_c/ast_c.ml
> +++ b/parsing_c/ast_c.ml
> @@ -343,7 +343,7 @@ and expression = (expressionbis * exp_info ref (* semantic: *)) wrap3
>
>    | SizeOfExpr     of expression
>    | SizeOfType     of fullType
> -  | Cast           of fullType * expression
> +  | Cast           of fullType * expression * attribute list
>
>    (* gccext: *)
>    | StatementExpr of compound wrap (* ( )     new scope *)
> diff --git a/parsing_c/ast_c.mli b/parsing_c/ast_c.mli
> index 8923a335..8a9a6f66 100644
> --- a/parsing_c/ast_c.mli
> +++ b/parsing_c/ast_c.mli
> @@ -104,7 +104,7 @@ and expressionbis =
>    | RecordPtAccess of expression * name
>    | SizeOfExpr of expression
>    | SizeOfType of fullType
> -  | Cast of fullType * expression
> +  | Cast of fullType * expression * attribute list

Maybe it would make more sense to put the attribute list after the
fullType, as is done for the SmPL AST?

julia

>    | StatementExpr of compound wrap
>    | Constructor of fullType * initialiser
>    | ParenExpr of expression
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
