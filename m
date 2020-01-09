Return-Path: <SRS0=kdHc=26=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91E6C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 10:47:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99FE62067D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jan 2020 10:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99FE62067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E7BD88045;
	Thu,  9 Jan 2020 10:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwD4zXyO+DU7; Thu,  9 Jan 2020 10:47:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A4E1288026;
	Thu,  9 Jan 2020 10:47:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90646C18DC;
	Thu,  9 Jan 2020 10:47:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24622C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 10:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1CE9C20405
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 10:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38hFRJZwZAsU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 10:47:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by silver.osuosl.org (Postfix) with ESMTPS id 75E75203F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jan 2020 10:47:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,413,1571695200"; d="scan'208";a="430596588"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 11:47:23 +0100
Date: Thu, 9 Jan 2020 11:47:23 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <20200108150518.6241-1-jaskaransingh7654321@gmail.com>
Message-ID: <alpine.DEB.2.21.2001091147060.10786@hadrien>
References: <20200108150518.6241-1-jaskaransingh7654321@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Linux-kernel-mentees] [PATCH] parsing_c: Handle case of
 annotation in function proto/def
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



On Wed, 8 Jan 2020, Jaskaran Singh wrote:

> For the following case:
>
> [const_vol] <type> [ptr] <annotation> <identifier> <open_par>
>
> The lookahead function in Parsing_hacks would mislabel <annotation> as a
> CppDirective, causing pretty printing errors.
>
> Add a case in the lookahead function for handling this case.

Applied.  Thanks!

julia

>
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> ---
>  parsing_c/parsing_hacks.ml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
> index 43421647..3f031f21 100644
> --- a/parsing_c/parsing_hacks.ml
> +++ b/parsing_c/parsing_hacks.ml
> @@ -2066,6 +2066,20 @@ let lookahead2 ~pass next before =
>  	&& is_type type_ ->
>  	  TCommentCpp (Token_c.CppDirective, i1)
>
> +        (* tt xx yy ( : xx is an annot *)
> +  | (TIdent (s, i1)::TIdent (s2, i2)::TOPar _::_, seen::_)
> +    when LP.current_context () = LP.InTopLevel
> +	&& (is_struct_enum before || is_type seen)
> +	&& s ==~ regexp_annot ->
> +	  TCommentCpp (Token_c.CppMacro, i1)
> +
> +        (* tt * xx yy ( : xx is an annot *)
> +  | (TIdent (s, i1)::TIdent (s2, i2)::TOPar _::_, ptr)
> +    when LP.current_context () = LP.InTopLevel
> +	&& pointer ptr
> +	&& s ==~ regexp_annot ->
> +	  TCommentCpp (Token_c.CppMacro, i1)
> +
>  	(* tt xx yy; : yy is an annot *)
>    | (TIdent (s, i1)::(TPtVirg _|TEq _)::_, TIdent (s2, i2)::type_::rest)
>      when (is_struct_enum (type_::rest)
> --
> 2.21.1
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
