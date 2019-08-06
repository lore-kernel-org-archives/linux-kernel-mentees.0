From: corbet@lwn.net (Jonathan Corbet)
Date: Tue, 6 Aug 2019 11:46:40 -0600
Subject: [Linux-kernel-mentees] [PATCH] Documentation: fs: Convert
 xfs-delayed-logging-design.txt to ReSt
In-Reply-To: <20190806090323.GA16095@localhost>
References: <20190806090323.GA16095@localhost>
Message-ID: <20190806114640.7eeb3f13@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190806174640.ChnXyr1LwLT4Xga9-gxl8Zj6mXt08i62WbRXUd54FEs@z>

On Tue, 6 Aug 2019 10:03:23 +0100
Sheriff Esseson <sheriffesseson at gmail.com> wrote:

> Convert xfs-delayed-logging-design.txt to ReST and fix broken references.
> The enumerations at "Lifecycle Changes" breaks because of lines begining with
> "<", treat as diagrams.

[...]

> @@ -27,14 +30,18 @@ written to disk after change D, we would see in the log the following series
>  of transactions, their contents and the log sequence number (LSN) of the
>  transaction:
>  
> +        ============           =========        ==============
>  	Transaction		Contents	LSN
> +        ============           =========        ==============
>  	   A			   A		   X
>  	   B			  A+B		  X+n
>  	   C			 A+B+C		 X+n+m
>  	   D			A+B+C+D		X+n+m+o
>  	    <object written to disk>
> -	   E			   E		   Y (> X+n+m+o)
> +        ------------------------------------------------------
> +	   E			   E		Y (> X+n+m+o)
>  	   F			  E+F		  Y+p
> +        ============           =========        ==============

So this is really more of a diagram than a table; I'd suggest just using a
literal block like you did elsewhere.

[...]

>  Lifecycle Changes
> +=================
>  
> -The existing log item life cycle is as follows:
> +The existing log item life cycle is as follows::
>  
>  	1. Transaction allocate
>  	2. Transaction reserve

This, instead, is a proper outline.  I guess the literal block is OK, but
it feels like we could do better.

Thanks,

jon
